# == Schema Information
#
# Table name: spaces
#
#  id             :integer          not null, primary key
#  price_per_hour :integer
#  address        :string
#  category       :string
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  name           :string
#  latitude       :float
#  longitude      :float
#  description    :text
#

class Space < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_attachments :photos, maximum: 5
end
