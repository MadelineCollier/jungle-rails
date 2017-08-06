class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews, dependent: :delete_all
  has_many :line_items, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def average_review
    reviews.average(:rating).round
  end

  def rating
    "Rated #{average_review}/5 from #{reviews.count} reviews"
  end

end
