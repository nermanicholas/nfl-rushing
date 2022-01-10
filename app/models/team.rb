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
end