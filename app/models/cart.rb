class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :items, through: :cart_items

  def total_price
    items.map { |item| item.price }.reduce(0, :+)
  end
end
