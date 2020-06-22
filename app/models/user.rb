class User < ApplicationRecord
  validates_presence_of :first_name, :last_name
  has_one :location, as: :locatable

end
