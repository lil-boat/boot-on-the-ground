class PostsController < ApplicationController

  def index
    @posts = Post.all

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    p "***************"
    p params[:post]
    if @post.save
      redirect_to "posts#index"
      p"&&&&&&&&&&&&&&&&"
      p @person
    else
      @errors = @post.errors.full_messages
      p "$$$$$$$$$$$$"
      p "didn't save"
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
