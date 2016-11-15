class Space < ApplicationRecord
  belongs_to :user
  has_attachments :photos, maximum: 5
end
