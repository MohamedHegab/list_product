class Product < ApplicationRecord
  validates_presence_of :title, :price, :description

  belongs_to :category
  has_one_attached :image
end
