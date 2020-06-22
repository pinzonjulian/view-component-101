class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :party
  has_one :location, through: :party

  enum state: {
    busy_that_day: -10,
    too_far_away: -9,
    pending: 0,
    arriving_late: 8,
    dying_to_go: 9,
    prepared_to_go: 10
  }

  def map_transit_predictions
    {
      walking: "#{rand(40..50)} days",
      horse: "#{rand(20..35)} days",
      dragon: "#{rand(12..66)} hours",
    }
  end
end
