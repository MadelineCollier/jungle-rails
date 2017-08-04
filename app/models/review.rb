class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates :user, :product, :rating, :description, presence: true
end
