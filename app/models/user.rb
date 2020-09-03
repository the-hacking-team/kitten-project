class User < ApplicationRecord
  has_one :cart
  has_many :orders
  has_many :items, through: :orders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :welcome_send
  after_create :create_cart

  private

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  rescue Exception => e
    # FIXME: can't see notice
    puts 'ERROR: welcome_send'
    flash[:notice] = "Compte bien créé, erreur dans l'envoie du mail, merci de nous contacter"
  end

  def create_cart
    Cart.create(user_id: id)
  end
end
