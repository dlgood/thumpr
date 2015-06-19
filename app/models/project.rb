class Project < ActiveRecord::Base
  has_many :stories
  has_many :user

  validates :p_name, presence: true

end
