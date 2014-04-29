class BuddyCirclesController < ApplicationController
  def index
    @buddy_circles = BuddyCircle.all
  end

  def new
    # @buddy_circle = BuddyCircle.new
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

  def edit
    @buddy_circle = BuddyCircle.find(params[:id])
  end

  def update
    @buddy_circle = BuddyCircle.find(params[:id])

    if @buddy_circle
      @buddy_circle.update_attributes(buddy_circle_params)
      redirect_to buddy_circle_url(@buddy_circle)
    else
      flash.now[:errors] = @buddy_circle.errors.full_messages
      render :edit
    end
  end

  private
  def buddy_circle_params
    params.require(:buddy_circle).permit(:name, :member_ids => [])
  end

end