class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user = current_user

    if @post.likes.create(author: @user)
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
