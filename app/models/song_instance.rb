class SongInstance < ActiveRecord::Base
  belongs_to :song
  belongs_to :gig_set
  has_one :gig, through: :gig_set

  validates :song_id, presence: true
  validates :gig_set_id, presence: true
end
