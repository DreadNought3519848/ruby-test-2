class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]

  # 一覧（タイムライン）。上部に投稿フォーム、下に投稿一覧を表示する構成。
  def index
    # 投稿フォーム用の空モデル
    @post = Post.new

    # 最新順で取得（ページネーションが必要なら後で追加）
    @posts = Post.order(created_at: :desc).includes(:comments)
  end

  # 詳細ページ（コメントと返信フォームを含む）
  def show
    # コメント投稿フォーム用の空モデル（nested route を想定）
    @comment = @post.comments.new
  end

  # 投稿作成（タイムラインでフォーム送信）
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: "投稿しました"
    else
      # エラー時は一覧を再表示してエラーメッセージを見せる
      @posts = Post.order(created_at: :desc).includes(:comments)
      flash.now[:alert] = "投稿に失敗しました"
      render :index, status: :unprocessable_entity
    end
  end

  # 投稿削除（トップ / タイムラインに削除ボタンを置く）
  def destroy
    @post.destroy
    redirect_to root_path, notice: "投稿を削除しました"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  # Strong Parameters：許可した属性だけ保存する
  def post_params
    params.require(:post).permit(:name, :content)
  end
end
