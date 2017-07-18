class PostsController < ApplicationController

  def index
    @posts = Post.all

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    p "***************"
    p params[:post]
    if @post.save
      redirect_to posts_path
      p"&&&&&&&&&&&&&&&&"
      p @post
    else
      @errors = @post.errors.full_messages
      render 'new'

    end 
  end

  def edit
    
  end

  def show
    
  end

  def destroy
    
  end

  private

  def post_params
    params.require(:post).permit(:category, :title, :body)
  end
end
