class PostsController < ApplicationController
  def index#WORKING
    @posts = Post.all
  end

  def new#WORKING
    @user = User.find_by(id: session[:user_id])
    @post = Post.new
  end

  def create#WORKING
    @user = User.find_by(id: session[:user_id])
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show#WORKING
    @comment = Comment.new
    this_post
  end

  def edit#WORKING
    this_post
  end

  def update#WORKING
    this_post
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  # def new_comment
  #   @post = Post.find(params[:id])
  #   #render new view page
  # end
  #
  # def new_comment_create
  #   @post.comments.build(comment_params)
  # end


  def destroy#WORKING
    this_post.destroy
    redirect_to posts_path
  end

################################################################
private

  def post_params
    params.require(:post).permit(:title, :content, :attributes, comments_attributes: [:text, :attributes])
  end


  def this_post
    @post = Post.find(params[:id])
  end

end
