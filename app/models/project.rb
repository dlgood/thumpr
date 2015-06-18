class Project < ActiveRecord::Base
  has_many :stories

  validates :p_name, presence: true

end
