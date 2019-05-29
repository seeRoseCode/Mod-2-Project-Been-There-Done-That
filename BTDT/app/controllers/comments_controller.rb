class CommentsController < ApplicationController

  def new
    @user = User.find_by(id: session[:user_id])
    session[:post_id] = params[:post]
    @comment = Comment.new
    # byebug
  end

  def create
    @user = User.find(session[:user_id])
    @post = Post.find(session[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post_id = @post.id
    @comment.user_id = @user.id
    if @comment.save
      session[:post_id] = nil
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  # def index
  #   @post =
  # end


  def show#WORKING
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
  end

  def destroy
    @comment = Comment.find_by(params[:id])
    @comment.delete
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end

end
