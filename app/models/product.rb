class Product < ApplicationRecord
  belongs_to :user
  has_attachment :photo
  validates :name, :description, :stock, :price, :weight, :category, :variety, :start_season, :end_season, :user_id, :published, presence: true
  has_many :order_items

  TYPES = [['Fruit', 'Légume'], ['Oeuf', 'Fromage', 'Lait'], ['Viande', 'Poisson'], ['Bière', 'Jus', 'Sirop']]
end
