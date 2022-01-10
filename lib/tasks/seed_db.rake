require 'json'

namespace :seed_db do

  desc "Populates DB with data from rushing.json"
  task rushing_data: :environment do
    puts "Seeding position data..."
    Position::ABBREVIATION_TO_NAME_MAP.each do |position_abbreviation, position_name|
      Position.create!(name: position_name, abbreviation: position_abbreviation)
    end

    puts "Seeding team data..."
    Team::ABBREVIATION_TO_NAME_MAP.each do |team_abbreviation, team_name|
      Team.create!(name: team_name, abbreviation: team_abbreviation)
    end

    puts "Seeding with rushing.json data..."
    data_source = "./rushing.json"
    json_data = JSON.parse(File.read(data_source))

    json_data.each do |data|
      team = Team.find_by(abbreviation: data["Team"])
      position = Position.find_by(abbreviation: data["Pos"])

      puts "Data: #{data}"
      puts "Team: #{data["Team"]}"
      puts "Position: #{data["Pos"]}"

      player = Player.create!(name: data["Player"], team: team, position: position)
      Rushing.create!(
        attempts: data["Att"],
        attempts_per_game: data["Att/G"],
        yards: data["Yds"],
        yards_per_attempt: data["Avg"],
        yards_per_game: data["Yds/G"],
        touchdowns: data["TD"],
        longest: data["Lng"],
        first_downs: data["1st"],
        first_down_percentage: data["1st%"],
        twenty_plus_yards: data["20+"],
        forty_plus_yards: data["40+"],
        fumbles: data["FUM"],
        player: player
      )
    end
  end

  desc "Populates DB with 10,000 records that are randomly generated"
  task ten_thousand_records: :environment do
    # TODO: generate 10k records
  end
end