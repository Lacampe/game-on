class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :update, :destroy, :edit]

  def index
    @spaces = Space.all
  end

  def show
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user
    @space.save
    redirect_to space_path(@space)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_space
    @space = Space.find(params[:id])
  end

  def space_params
    params.require(:space).permit(:name, :category, :address, :price_per_hour, photos:[])
  end
end
