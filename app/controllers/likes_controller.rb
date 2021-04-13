class LikesController < ApplicationController
  def create
    @post = Post.find_by(id: params[:post_id])
    @like = current_user.likes.create(post_id: params[:post_id], liked_user_id: @post.user_id)
    @user = User.find_by(id: current_user.id)
    @user.point += 1
    @user.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find_by(id: params[:post_id])
    @like = current_user.likes.find_by(post_id: @post.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
