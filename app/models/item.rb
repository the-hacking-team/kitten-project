class Item < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :price, presence: true
  validates :image_url, uniqueness: true

end
