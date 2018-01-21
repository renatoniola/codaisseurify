class Artist < ApplicationRecord
  validates :name, presence: true

  has_many :songs , dependent: :destroy
  has_many :photos


end
