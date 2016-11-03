class Gig < ActiveRecord::Base
  has_many :gig_sets

  before_create :add_two_sets

private
  def add_two_sets
    self.gig_sets = [GigSet.new(number: 1), GigSet.new(number: 2)]
  end
end
