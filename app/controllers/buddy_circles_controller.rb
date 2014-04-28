class BuddyCirclesController < ApplicationController
  def index
    @buddy_circles = BuddyCircle.all
  end

  def new
  end

  def create
    @buddy_circle = BuddyCircle.new(buddy_circle_params)
    @buddy_circle.owner_id = current_user.id
    if @buddy_circle.save
      redirect_to buddy_circle_url(@buddy_circle)
    else
      flash.now[:errors] = @buddy_circle.errors.full_messages
      render :new
    end
  end

  def show
    @buddy_circle = BuddyCircle.find(params[:id])
  end

  private
  def buddy_circle_params
    params.require(:buddy_circle).permit(:name, :owner_id, :member_ids => [])
  end

end