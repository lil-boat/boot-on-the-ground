class LikesController < ApplicationController
before_action :authenticate_user!
  def create

    def likeable_type
      if params.keys.last == "comment_id"
        return "Comment"
      else
        return "Post"
      end
    end

    likeable_id = likes_params[likes_params.keys[0]].to_i

    @like = Like.new(likeable_id: likeable_id, likeable_type: likeable_type, user_id: current_user.id)
    if @like.save

      if likeable_type == "Comment"
        p "*" * 50

        p "*" * 50

        like_count = Comment.find(likeable_id).likes.count
        p like_count
        render json: {like_count: like_count}.to_json
      elsif likeable_type == "Post"
        like_count = Post.find(likeable_id).likes.count
        render json: {like_count: like_count}.to_json
      end
    else
      p "yikes, something went wrong"
    end
    p "*" * 50
    p @like
  end

  private

  def likes_params
    params.permit(:post_id, :comment_id)
  end

end
