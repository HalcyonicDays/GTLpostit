class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    
    @comment.save ? (redirect_to post_path(@post)) : (render 'posts/show' )
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end