class Product < ApplicationRecord
  belongs_to :user
  validates :name, :description, :stock, :price, :weight, :category, :variety, :start_season, :end_season, :user_id, :published, presence: true
end
