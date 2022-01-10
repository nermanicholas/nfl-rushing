=begin

POSITION

Attribute       Type          Additional Info
  id            integer       not null, primary key
  name          string
  abbreviation  string

=end

class Position < ApplicationRecord
  has_many :players

  validates :name, uniqueness: true
  validates :abbreviation, uniqueness: true

  ABBREVIATION_TO_NAME_MAP = {
    "QB" => "Quarterback",
    "RB" => "Running Back",
    "FB" => "Fullback",
    "WR" => "Wide Receiver",
    "TE" => "Tight End",
    "OL" => "Offensive Lineman",
    "C" => "Center",
    "G" => "Guard",
    "LG" => "Left Guard",
    "RG" => "Right Guard",
    "T" => "Tackle",
    "LT" => "Left Tackle",
    "RT" => "Right Tackle",
    "K" => "Kicker",
    "KR" => "Kick Returner",
    "DL" => "Defensive Lineman",
    "DE" => "Defensive End",
    "DT" => "Defensive Tackle",
    "NT" => "Nose Tackle",
    "LB" => "Linebacker",
    "ILB" => "Inside Linebacker",
    "OLB" => "Outside Linebacker",
    "MLB" => "Middle Linebacker",
    "DB" => "Defensive Back",
    "CB" => "Cornerback",
    "FS" => "Free Safety",
    "SS" => "Strong Safety",
    "S" => "Safety",
    "P" => "Punter",
    "PR" => "Punt Returner"
}.freeze
end