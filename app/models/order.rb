class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  after_create :order_delivery


  private

  def order_delivery
    UserMailer.order_delivery_email(self).deliver_now
  end

end
