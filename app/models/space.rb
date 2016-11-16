class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_attachments :photos, maximum: 5
end
