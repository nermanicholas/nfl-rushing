=begin

PLAYER

Attribute       Type          Additional Info
  id            integer       not null, primary key
  name          string
  team_id       integer       not null
  position_id   integer       not null

=end

class Player < ApplicationRecord
  belongs_to :team
  belongs_to :position
  has_one :rushing
end