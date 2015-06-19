class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignee, :class_name => "User"
  belongs_to :team

  validates :role, :goal, :benefit, presence: true 

end
