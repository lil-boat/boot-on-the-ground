class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
  end

  private

  def post_params
    params.require(:comment).permit(:body)
  end

end
