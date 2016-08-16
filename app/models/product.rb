class Product < ApplicationRecord
  belongs_to :user
  validates :name, :description, :stock, :price, :weight, :category, :variety, :start_season, :end_season, :user_id, :published, presence: true

  TYPES = [['Fruit', 'Légume'], ['Oeuf', 'Fromage', 'Lait'], ['Viande', 'Poisson'], ['Bière', 'Jus', 'Sirop']]
end
