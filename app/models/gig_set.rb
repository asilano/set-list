class GigSet < ActiveRecord::Base
  belongs_to :gig
  has_many :song_instances, -> { order :order }
  has_many :songs, through: :song_instances
end
