class Room < ApplicationRecord
  has_many :reservations, dependent: :destroy
  belongs_to :user
  #mount_uploader :image, ImageUploader
  has_one_attached :image

  validates :introduce, presence: true
  
end
