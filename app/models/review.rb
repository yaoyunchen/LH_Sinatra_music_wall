class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :song
  validates :user, :song, presence: true
  validates :rating,
    numericality: {
      only_integer: true,
      minimum: 0,
      maximum: 5
    }
end