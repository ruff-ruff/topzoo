class Animal < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :fans, through: :favorites, source: :user

  validates :name, :scientific_name, :summary, :habitat, :taxonomy, presence: true

  scope :most_favorited, -> { left_joins(:favorites).group(:id).order(Arel.sql("COUNT(favorites.id) DESC"), :name) }

  def favorite_count
    favorites.size
  end
end
