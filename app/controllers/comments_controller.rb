class CommentsController < ApplicationController
  layout 'standard'

  def new
    @comment = Comment.new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.author = current_user

    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment created successfully'
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
