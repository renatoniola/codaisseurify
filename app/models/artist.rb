class Artist < ApplicationRecord
  validates :name, presence: true

  has_many :songs , dependent: :destroy
  has_many :photos ,dependent: :destroy

  def self.order_by_name_asc
    order(name: :asc)
  end

  def self.order_by_name_desc
    order(name: :desc)
  end

  def self.order_by_date_asc
    order(created_at: :asc)
  end

  def self.order_by_date_desc
    order(created_at: :desc)
  end
end
