class RushingStatsController < ApplicationController
  def show
    @columns = Rushing::COLUMN_NAME_TO_ATTRIBUTE_MAP.keys
    @rows = Rushing.all
    render "index"
  end
end