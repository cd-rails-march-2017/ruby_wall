class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 4 }, presence: true 
end
