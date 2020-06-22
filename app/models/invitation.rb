class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :party
  has_one :location, through: :party
end
