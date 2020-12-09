class ItemsController < ApplicationController
  def index
    @items = Item.all
    gon.items = @items
    if Field.find_by(user_id: current_user.id) != nil
      gon.lat = Field.find_by(user_id: current_user.id).latitude
      gon.lng = Field.find_by(user_id: current_user.id).longitude
      @lat = Field.find_by(user_id: current_user.id).latitude
      @lng = Field.find_by(user_id: current_user.id).longitude
    end
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    item = Item.new(item_params)
    if item.valid?
      Item.create(item_params)
      redirect_to :root
    else
      @item = Item.new(item_params)
      render :new
    end
  end

  def sequel
    @items = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:wash_power_id, :dry_power_id, :start_time_id, :end_time_id, :status_id, :point, :comment, :address, :user_id, :latitude, :longitude).merge(user_id: current_user.id)
  end
end
