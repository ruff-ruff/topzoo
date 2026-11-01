class AnimalsController < ApplicationController
  before_action :require_admin, only: %i[new create edit update]
  before_action :set_animal, only: %i[show edit update]

  def index
    @animals = Animal.order(:name)
  end

  def popular
    @animals = Animal.most_favorited
    render :index
  end

  def show
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to @animal, notice: "Animal added to the catalog."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @animal.update(animal_params)
      redirect_to @animal, notice: "Animal information updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:name, :scientific_name, :summary, :habitat, :image_url, :taxonomy)
  end
end
