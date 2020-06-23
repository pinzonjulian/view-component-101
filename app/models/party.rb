class Party < ApplicationRecord
  has_many :invitations
  has_many :users, through: :invitations
  has_one :location, as: :locatable
  has_rich_text :description
end
