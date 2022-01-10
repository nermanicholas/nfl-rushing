=begin

TEAM

Attribute       Type          Additional Info
  id            integer       not null, primary key
  name          string
  abbreviation  string

=end

class Team < ApplicationRecord
  has_many :players

  validates :name, uniqueness: true
  validates :abbreviation, uniqueness: true

  ABBREVIATION_TO_NAME_MAP = {
    "ARI" => "Arizona Cardinals",
    "ATL" => "Atlanta Falcons",
    "BAL" => "Baltimore Ravens",
    "BUF" => "Buffalo Bills",
    "CAR" => "Carolina Panthers",
    "CHI" => "Chicago Bears",
    "CIN" => "Cincinnati Bengals",
    "CLE" => "Cleveland Browns",
    "DAL" => "Dallas Cowboys",
    "DEN" => "Denver Broncos",
    "DET" => "Detroit Lions",
    "GB" => "Green Bay Packers",
    "HOU" => "Houston Texans",
    "IND" => "Indianapolis Colts",
    "JAX" => "Jacksonville Jaguars",
    "KC" => "Kansas City Chiefs",
    "OAK" => "Oakland Raiders",
    #"LV" => "Las Vegas Raiders",
    "LA" => "Los Angeles Rams",
    #"LAR" => "Los Angeles Rams",
    "SD" => "San Diego Chargers",
    #"LAC" => "Los Angeles Chargers",
    "MIA" => "Miami Dolphins",
    "MIN" => "Minnesota Vikings",
    "NE" => "New England Patriots",
    "NO" => "New Orleans Saints",
    "NYG" => "New York Giants",
    "NYJ" => "New York Jets",
    "PHI" => "Philadelphia Eagles",
    "PIT" => "Pittsburgh Steelers",
    "SF" => "San Francisco 49ers",
    "SEA" => "Seattle Seahawks",
    "TB" => "Tampa Bay Buccaneers",
    "TEN" => "Tennessee Titans",
    "WAS" => "Washington Football Team"
}.freeze
end