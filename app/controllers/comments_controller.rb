class CommentsController < ApplicationController
  
  def create
    p "*" * 10

    @comment = Comment.new(comment_params)
    p "*" * 10
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html {render "_comments_partial", layout: false}
      end
    else
      "we've got a problem"
    end 



  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end

end
