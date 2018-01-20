class Artist < ApplicationRecord
  validates :name, presence: true

  has_many :songs , dependent: :destroy
  mount_uploader :image_url, ImageUploader
end
