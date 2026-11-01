class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :animal

  validates :animal_id, uniqueness: { scope: :user_id }
  validate :user_has_fewer_than_three_favorites, on: :create

  private

  def user_has_fewer_than_three_favorites
    return if user.blank? || user.favorites.where.not(id: id).count < 3

    errors.add(:base, "You already have three favorites. Remove one before choosing another.")
  end
end
