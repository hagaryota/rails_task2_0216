class Room < ApplicationRecord
    has_many :reservations
  #mount_uploader :image, ImageUploader
  has_one_attached :image

  validates :introduce, presence: true
  
end
