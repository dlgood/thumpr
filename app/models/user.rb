class User < ActiveRecord::Base
  has_many :stories
  belongs_to :team
  
  mount_uploader :file, Uploader

  validates :name, :password, presence: true, length: {in:1..20}
  validates :email, uniqueness: true, length: {in: 4..20} 

end
