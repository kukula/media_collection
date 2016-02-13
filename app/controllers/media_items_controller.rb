class MediaItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @media_items = MediaItem.all
  end

  def create
    media_item = MediaItem.new(media_item_params)
    if media_item.save
      redirect_to root_path, notice: "Media item was created successfully."
    else
      render :new, alert: "Please fill all fields."
    end
  end

  private

  def media_item_params
    params.require(:media_item).permit(:link, :title).merge(user_id: current_user.id)
  end
end
