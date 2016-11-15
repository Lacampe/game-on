class SpacesController < ApplicationController
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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def space_params
    params.requite(:space).permit(:name, :category, :address, :price_per_hour, photos:[])
  end
end
