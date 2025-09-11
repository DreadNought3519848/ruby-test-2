class PostsController < ApplicationController
  # 投稿一覧
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  # 投稿フォーム
  def new
    @post = Post.new
  end

  # 投稿保存
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: "投稿しました！"
    else
      render :new
    end
  end

  # 投稿詳細
  def show
    @post = Post.find(params[:id])
  end

  # 投稿削除
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: "削除しました。"
  end

  private

  def post_params
    params.require(:post).permit(:name, :content)
  end
end
