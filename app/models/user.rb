class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products, dependent: :destroy
  has_many :orders
  has_many :order_items, through: :orders
  has_many :products, through: :orders
  has_many :users, through: :products

  has_attachment :avatar
  has_attachment :photo

end
