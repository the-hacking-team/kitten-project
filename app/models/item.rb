class Item < ApplicationRecord
  has_many :cart_items
  has_many :carts, through: :cart_items
  has_many :order_items
  has_many :orders, through: :order_items

  validates :title, presence: true, uniqueness: true
  validates :price, presence: true
  validates :image_url, uniqueness: true

end
