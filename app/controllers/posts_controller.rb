class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def new
    @post = Post.new
    @user = User.find_by(id: current_user.id)
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user.id != current_user.id
      redirect_to posts_path, alert: "不正なアクセスです。"
    end
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @user = @post.user
    if @user.point == nil
      @user.point = 0
      @post.save
      @user.save
      redirect_to post_path(@post),notice: "積み上げを記録しました。"
    elsif @user.point >= 3
      @user.point -= 3
      @post.save
      @user.save
      redirect_to post_path(@post),notice: "積み上げを記録しました。"
    elsif @user.point < 3
      redirect_to posts_path,notice: "積み上げを記録するにはあと#{3-@user.point}回他の人をスゴイね！してください。"
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post),notice: "更新に成功しました。"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

end
