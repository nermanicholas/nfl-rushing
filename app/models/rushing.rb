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
end