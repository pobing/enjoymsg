class CommentsController < ApplicationController
  # http_basic_authenticate_with :name => "admin" ,:password => "123",:except => [:index, :show]
  
  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
