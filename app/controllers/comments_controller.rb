class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @page_title = 'Add New Comment'
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @id = params[:stamp_id]
    if @comment.save
      flash[:notice] = "Comment Created!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    flash[:notice] = 'Comment Updated'
    redirect_to current_user
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'comment Removed'
    redirect_to current_user
  end

  def show
    @comment = Comment.find_by_id(params[:id])
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :stamp_id)
  end
end
