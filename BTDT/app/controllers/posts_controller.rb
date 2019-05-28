class PostsController < ApplicationController
  def index#WORKING
    @posts = Post.all
  end

  def new
    @user = User.find_by(id: session[:user_id])
    # byebug
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path(@post)
    else
      render :new
    end

  end

  def show#WORKING
    this_post
  end

  def edit#WORKING
    this_post
  end

  def update#WORKING
    this_post
    this_post.user_id = @post.user.id
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy#WORKING
    this_post.delete
    redirect_to posts_path
  end

################################################################
private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def this_post
    @post = Post.find(params[:id])
  end
end
