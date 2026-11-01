class FavoritesController < ApplicationController
  before_action :require_login

  def index
    @animals = current_user.favorite_animals.order(:name)
  end
end
