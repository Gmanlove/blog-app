class PostsController < ApplicationController
  layout 'standard'

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments, author: :comments)
    @current_user = current_user
  end

  def show
    @post = Post.find(params[:id])
    @current_user = current_user
  end

  def new
    @user = current_user
    @post = Post.new
  end

  def like
    @post = Post.find(params[:id])
    @like = Like.new(author_id: params[:user_id], post_id: @post.id)

    if @like.save
      @post.likes_counter += 1 # Increment the likes count by 1
      @post.save
      redirect_to user_post_path(params[:user_id], @post), notice: 'Like added successfully'
    else
      redirect_to user_post_path(params[:user_id], @post), alert: 'Failed to add like'
    end
  end

  def create
    @user = current_user
    @post = @user.posts.build(post_params)
    # @post.author_id = current_user.id
    # @post.comments_counter = 0
    # @post.likes_counter = 0

    if @post.save
      redirect_to user_posts_path(@user), notice: 'Post created successfully'
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
