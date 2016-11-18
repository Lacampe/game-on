class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :update, :destroy, :edit]
  skip_before_action :authenticate_user!, only: [ :show, :index ]
  # before_action :set_user, only: [:show]

  def index

    @spaces = Space.all

    @spaces = @spaces.near(params[:location], 10) if params[:location].present?
    @spaces = @spaces.where(category: params[:category]) if params[:category].present?

    @markers = Gmaps4rails.build_markers(@spaces) do |space, marker|
      marker.lat space.latitude
      marker.lng space.longitude
      # marker.infowindow render_to_string(partial: "/spaces/map_box", locals: { space: space })
    end
  end

  def show
    @space = Space.find(params[:id])
    @user = @space.user
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
    @space.user_id = current_user.id
    @space.save
    redirect_to space_path(@space)
    # UserMailer.send_user_space_confirmation_email(current_user, @space).deliver
    UserNotifierMailer.send_user_space_confirmation_email(current_user, @space).deliver
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

  # def set_user
  #   @user = User.find(params[:user_id])
  # end

  def space_params
    params.require(:space).permit(:name, :category, :address, :price_per_hour, :user_id, :booking_id, :description, photos:[])
  end
end
