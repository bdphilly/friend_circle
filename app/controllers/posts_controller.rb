class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def feed
    @posts = Post.all
  end


  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.links.new(link_params)

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to buddy_circles_url
  end

  private
  def post_params
    params.require(:post).permit(:author_id, :body)
  end

  def link_params
    params.permit( links: [:url] )
          .require(:links)
          .values
          .reject { |data| data.values.all?(&:blank?) }
  end
end

# params = {
#   post: { body: "BODY BODY BODY" },
#   links: {
#     0 => { url: "google.com" },
#     1 => { url: "yahoo.com" }
#   }
# }
#
#
# Users
# * name
# * is_admin
# * On signup, set name, set is_admin to false
# * Edit form
# * input tag for name
# * In Chrome, they change the name input, to an input tag for is_admin
