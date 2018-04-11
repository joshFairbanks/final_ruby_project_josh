class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def delete
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:author, :description))
    redirect_to post_path(@post)
  end  
  
end
