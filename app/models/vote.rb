class Vote < ActiveRecord::Base
  belongs_to :user, :song

  validates :user, :song, presence: true
end