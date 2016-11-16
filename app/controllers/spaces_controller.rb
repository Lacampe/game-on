class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :update, :destroy, :edit]

  def index
    @spaces = Space.where.not(latitude: nil, longitude: nil)

    @markers = Gmaps4rails.build_markers(@spaces) do |space, marker|
      marker.lat space.latitude
      marker.lng space.longitude
      # marker.infowindow render_to_string(partial: "/spaces/map_box", locals: { space: space })
    end
  end

  def show
    @space = Space.find(params[:id])
    @booking = Booking.new

    @markers = Gmaps4rails.build_markers(@space) do |space,marker|
      marker.lat space.latitude
      marker.lng space.longitude
    end
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
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
