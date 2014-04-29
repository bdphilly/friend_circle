class LinkController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    post = Post.find()
    @link = Link.new(link_params)

    if @link.save
      redirect_to
  end

  private
  def link_params
    params.permit( links: [:post_id, :url] ).require(:links).values
  end
end