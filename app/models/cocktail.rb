class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients , through: :doses

  validates :name, uniqueness: true, presence: true
  validates :image_url, uniqueness: true, presence: true
end
