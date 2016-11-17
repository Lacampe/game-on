class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  validates :duration, :inclusion => {:in => (1..12)}
end
