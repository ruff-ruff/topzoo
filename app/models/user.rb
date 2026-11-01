class User < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favorite_animals, through: :favorites, source: :animal

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, on: :create
  validates :role, inclusion: { in: %w[user admin] }

  def admin?
    role == "admin"
  end
end
