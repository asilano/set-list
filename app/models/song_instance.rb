class SongInstance < ActiveRecord::Base
  belongs_to :song
  belongs_to :gig_set
  has_one :gig, through: :gig_set
end
