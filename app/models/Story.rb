class Story < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignee, :class_name => "User"
end
