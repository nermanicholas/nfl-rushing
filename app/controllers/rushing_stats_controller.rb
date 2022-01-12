class RushingStatsController < ApplicationController
  helper_method :sortable_columns, :sort_column, :sort_direction

  RUSHING_STATS_QUERY = "players.name AS player_name, teams.abbreviation AS team_name, positions.abbreviation AS player_position, rushings.*"

  def show
    @labels_to_columns = Rushing::COLUMN_NAME_TO_ATTRIBUTE_MAP
    rushing_stats = Rushing.joins(player: [:team, :position]).select(RUSHING_STATS_QUERY)
    @rows = rushing_stats.order("#{sort_column} #{sort_direction}")
  end

  private

  def sortable_columns
    Rushing::SORTABLE_COLUMNS
  end

  def sort_column
    sortable_columns.include?(params[:column]&.to_sym) ? params[:column].to_sym : ""
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : ""
  end
end