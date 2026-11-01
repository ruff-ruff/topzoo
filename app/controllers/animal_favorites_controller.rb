class AnimalFavoritesController < ApplicationController
  before_action :require_login
  before_action :set_animal

  def create
    favorite = current_user.favorites.build(animal: @animal)
    if favorite.save
      redirect_to @animal, notice: "#{@animal.name} is now one of your favorites."
    else
      redirect_to @animal, alert: favorite.errors.full_messages.to_sentence
    end
  end

  def destroy
    current_user.favorites.find_by!(animal: @animal).destroy
    redirect_to @animal, notice: "#{@animal.name} was removed from your favorites."
  end

  private

  def set_animal
    @animal = Animal.find(params[:animal_id])
  end
end
