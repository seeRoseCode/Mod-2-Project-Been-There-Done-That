class CommentsController < ApplicationController

  def new###BUG###
    @user = User.find_by(id: session[:user_id])
    # session[:post_id] = params[:post]
    @comment = Comment.new
    # byebug
  end

  def create###BUG###
    @user = User.find(session[:user_id])
    @post = Post.find(session[:post_id])
    @comment = Comment.new(comment_params)
    # @comment.post_id = @post.id
    # @comment.user_id = @user.id
    if @comment.save
      # session[:post_id] = nil
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show#WORKING
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to posts_path#May need to go to user_path
    else
      render :edit
    end
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
