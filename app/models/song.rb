class Song < ActiveRecord::Base
  has_many :song_instances, dependent: :destroy
  has_many :gig_sets, through: :song_instances
  scope :by_title, -> { order(:title) }
end
