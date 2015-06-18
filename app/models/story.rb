class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignee, :class_name => "User"

  validates :role, :goal, :benefit, presence: true 

end
