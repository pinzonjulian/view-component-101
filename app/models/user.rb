class User < ApplicationRecord
  has_person_name

  validates_presence_of :first_name, :last_name
  has_one :location, as: :locatable

  def avatar_url
    last_name == 'Stark' ? 'stark_family_shield' : nil
  end

end
