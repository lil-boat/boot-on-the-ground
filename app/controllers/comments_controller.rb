class CommentsController < ApplicationController
  
  def create

    @comment = Comment.new(comment_params)
    
    p "$" * 50
    p @comment
    p "*" * 50



  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

end
