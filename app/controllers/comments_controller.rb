class CommentsController < ApplicationController
  
  def create
    p "$" * 50
    p comment_params
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    p @comment
    p "*" * 50



  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

end
