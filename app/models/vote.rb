class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :song

  validates :user, :song, presence: true
  validates :user_id, uniqueness: {scope: :song_id}
end