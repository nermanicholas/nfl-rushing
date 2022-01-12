=begin

RUSHING

Attribute                   Type          Additional Info
  id                        integer       not null, primary key
  attempts_per_game         float
  attempts                  integer
  yards                     integer
  yards_per_attempt         float
  yards_per_game            float
  touchdowns                integer
  longest                   integer
  first_downs               integer
  first_down_percentage     float
  twenty_plus_yards         integer
  forty_plus_yards          integer
  fumbles                   integer
  player_id                 integer       not null, foreign key
=end

class Rushing < ApplicationRecord
  belongs_to :player

  COLUMN_NAME_TO_ATTRIBUTE_MAP = {
    "Player" => :player_name,
    "Team" => :team_name,
    "Pos" => :player_position,
    "Att" => :attempts,
    "Att/G" => :attempts_per_game,
    "Yds" => :yards,
    "Avg" => :yards_per_attempt,
    "Yds/G" => :yards_per_game,
    "TD" => :touchdowns,
    "Lng" => :longest,
    "1st" => :first_downs,
    "1st%" => :first_down_percentage,
    "20+" => :twenty_plus_yards,
    "40+" => :forty_plus_yards,
    "FUM" => :fumbles
}.freeze

  SORTABLE_COLUMNS = [ :yards, :longest, :touchdowns ].freeze
end