class Song < ActiveRecord::Base
  scope :by_title, -> { order(:title) }
end
