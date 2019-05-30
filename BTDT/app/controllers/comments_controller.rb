class CommentsController < ApplicationController

  def new###BUG###
    @user = User.find_by(id: session[:user_id])
    # session[:post_id] = params[:post]
    @comment = Comment.new
  end

  def create###BUG###
    @user = User.find(session[:user_id])
    @post = Post.find(params["comment"]["post_id"])
    # @comment = @post.comments.build(user_id: @user.id, text: params[:text] )
    @comment = @post.comments.build(comment_params)
    @comment.user_id = @user.id
    if @comment.save!(validate: false)
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
      redirect_to post_path(@comment.post)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find_by(params[:id])
    @post = Post.find(@comment.post.id)
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :post_id, :user_id)
  end

end
