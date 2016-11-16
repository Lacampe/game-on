class Space < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_attachments :photos, maximum: 5
end
