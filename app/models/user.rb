class User < ActiveRecord::Base
  has_many :songs
  has_many :votes
  
  validates :email,
    presence: true,
    uniqueness: true,
    format: {with: /.{2,}@\w{2,}\.\w{2,}\.?\w?{2,}/}

  validates :password,
    presence: true,
    length: {minimum: 5}

  validates :name,
    presence: true

end