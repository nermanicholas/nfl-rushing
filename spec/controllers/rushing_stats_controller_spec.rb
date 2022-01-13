require "rails_helper"
require "csv"

RSpec.describe RushingStatsController, type: :controller do
  # Positions
  let(:qb) { create(:position, :QB) }
  let(:wr) { create(:position, :WR) }
  let(:rb) { create(:position, :RB) }
  let(:fs) { create(:position, :FS) }

  # Teams
  let(:oak) { create(:team, :OAK) }
  let(:tb) { create(:team, :TB) }
  let(:nyj) { create(:team, :NYJ) }
  let(:ne) { create(:team, :NE) }

  # Players
  let(:auston_matthews) { create(:player, :auston_matthews, team: oak, position: qb) }
  let(:john_doe) { create(:player, :john_doe, team: tb, position: wr) }
  let(:john_snow) { create(:player, :john_snow, team: nyj, position: rb) }
  let(:eren_yeager) { create(:player, :eren_yeager, team: ne, position: fs) }

  # Rushing Stats
  before :each do
    bad_rushing_stats = create(:rushing, :bad_rushing_stats, player: john_doe)
    average_rushing_stats = create(:rushing, :average_rushing_stats, player: john_snow)
    good_rushing_stats = create(:rushing, :good_rushing_stats, player: auston_matthews)
  end

  context "displaying data" do
    it "returns all results" do
      get :show, format: 'json'

      expect(JSON.parse(response.body)).to include(
        rushing_stats_json_data_for_player(auston_matthews),
        rushing_stats_json_data_for_player(john_doe),
        rushing_stats_json_data_for_player(john_snow)
      )
    end
  end

  context "sorting and searching" do
    it "returns all results sorted in ascending order for the yards column" do
      get :show, params: { column: 'yards', direction: 'asc' }, format: 'json'

      expect(JSON.parse(response.body)).to contain_exactly(
        rushing_stats_json_data_for_player(john_doe),
        rushing_stats_json_data_for_player(john_snow),
        rushing_stats_json_data_for_player(auston_matthews)
      )
    end

    it "returns all results sorted in descending order for the yards column" do
      get :show, params: { column: 'yards', direction: 'asc' }, format: 'json'

      expect(JSON.parse(response.body)).to contain_exactly(
        rushing_stats_json_data_for_player(auston_matthews),
        rushing_stats_json_data_for_player(john_snow),
        rushing_stats_json_data_for_player(john_doe)
      )
    end

    it "returns all results unsorted if an unsortable column is passed in the query" do
      get :show, params: { column: 'player_name', direction: 'desc' }, format: 'json'

      expect(JSON.parse(response.body)).to contain_exactly(
        rushing_stats_json_data_for_player(auston_matthews),
        rushing_stats_json_data_for_player(john_doe),
        rushing_stats_json_data_for_player(john_snow),
      )
    end

    it "returns all results with a player name matching the search criteria" do
      get :show, params: { name: 'John' }, format: 'json'

      expect(JSON.parse(response.body)).to contain_exactly(
        rushing_stats_json_data_for_player(john_doe),
        rushing_stats_json_data_for_player(john_snow)
      )
    end

    it "returns all results matching the player name search criteria in descending order by the longest column" do
      get :show, params: { name: 'John', column: 'longest', direction: 'desc' }, format: 'json'

      expect(JSON.parse(response.body)).to contain_exactly(
        rushing_stats_json_data_for_player(john_snow),
        rushing_stats_json_data_for_player(john_doe)
      )
    end
  end

  context "downloading csv" do
    it "returns a csv output with all the results" do
      get :show, format: 'csv'

      result = convert_csv_to_hash(response.body)

      expect(result[:headers]).to eq([
        "Player", "Team", "Pos", "Att", "Att/G", "Yds", "Avg", "Yds/G", "TD", "Lng", "1st", "1st%", "20+", "40+", "FUM"
      ])
      expect(result[:rows]).to contain_exactly(
        format_json_data(rushing_stats_json_data_for_player(auston_matthews)),
        format_json_data(rushing_stats_json_data_for_player(john_doe)),
        format_json_data(rushing_stats_json_data_for_player(john_snow)),
      )
    end

    it "returns a csv output with all the results that match the search query and is in descending order by the longest column" do
      get :show, params: { name: 'John', column: 'longest', direction: 'desc' }, format: 'csv'

      result = convert_csv_to_hash(response.body)

      expect(result[:headers]).to eq([
        "Player", "Team", "Pos", "Att", "Att/G", "Yds", "Avg", "Yds/G", "TD", "Lng", "1st", "1st%", "20+", "40+", "FUM"
      ])
      expect(result[:rows]).to contain_exactly(
        format_json_data(rushing_stats_json_data_for_player(john_snow)),
        format_json_data(rushing_stats_json_data_for_player(john_doe))
      )
    end
  end

  def format_json_data(json_data)
    json_data.except("id", "player_id").symbolize_keys
  end

  def rushing_stats_json_data_for_player(player)
    player.rushing.attributes.merge({
      "player_name" => player.name,
      "team_name" => player.team.abbreviation,
      "player_position" => player.position.abbreviation
    }).except("updated_at", "created_at")
  end

  def convert_csv_to_hash(csv)
    hash = CSV.parse(response.body).map { |a| Hash[Rushing::LABEL_TO_COLUMN_MAP.values.zip(a)] }
    rows = hash[1..-1].map do |row|
      row.merge(row) do |key, val|
        if [:player_name, :team_name, :player_position].include?(key)
          val
        elsif val.include?('.')
          val.to_f
        else
          val.to_i
        end
      end
    end
    { headers: hash.first.values, rows: rows }
  end
end