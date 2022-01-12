class RushingStatsController < ApplicationController
  helper_method :search_name, :sortable_columns, :sort_column, :sort_direction, :permitted_params

  RUSHING_STATS_QUERY = "players.name AS player_name, teams.abbreviation AS team_name, positions.abbreviation AS player_position, rushings.*"

  def show
    @labels_to_columns = Rushing::LABEL_TO_COLUMN_MAP
    rushing_stats = Rushing.joins(player: [:team, :position]).select(RUSHING_STATS_QUERY)

    # Retrieves search criteria if provided
    rushing_stats = rushing_stats.where(["player_name like ?", "%#{search_name}%"]) if search_name.present?

    # Applys column sorting with specified direction (asc or desc)
    @rows = rushing_stats.order("#{sort_column} #{sort_direction}")

    respond_to do |format|
      format.html
      format.csv {
        send_data RushingStatsCsvFormatter.build_csv(@labels_to_columns, @rows), filename: "rushing_stats.csv"
      }
    end
  end

  private

  def permitted_params
    [ :format, :direction, :column, :name ]
  end

  def search_name
    params[:name]
  end

  def sortable_columns
    Rushing::SORTABLE_COLUMNS
  end

  def sort_column
    sortable_columns.include?(params[:column]&.to_sym) ? params[:column].to_sym : "player_name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end