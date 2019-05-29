class CommentsController < ApplicationController

  def new
    @user = User.find_by(id: session[:user_id])
    @post = Post.find_by(session[:post_id])
    @comment = Comment.new
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @post = Post.find_by(session[:post_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@post) 
    else  
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end 

  private
  def comment_params
    params.require(:comment).permit(:text)
  end

end
