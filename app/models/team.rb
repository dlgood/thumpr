class Team < ActiveRecord::Base
  has_many :stories
  has_many :users

  validates :team_name, presence: true

end
