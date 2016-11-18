# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  price      :integer
#  user_id    :integer
#  space_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  starts_at  :datetime
#  ends_at    :datetime
#

class Booking < ApplicationRecord
  attr_writer :duration

  belongs_to :user
  belongs_to :space
  has_one :user_review
  has_one :space_review

  before_validation do
    self.ends_at = starts_at + @duration.to_i.hours if @duration
  end

  def duration
    return unless ends_at? && starts_at?

    ((ends_at - starts_at) / 1.hour).round
  end
end
