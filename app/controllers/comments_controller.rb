class CommentsController < ApplicationController
  before_action :set_post

  # コメント作成（詳細画面から送信）
  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      # 詳細ページに戻る（明示的に show にリダイレクト）
      redirect_to post_path(@post), notice: "返信しました"
    else
      # 失敗したら詳細画面を再描画してエラーを表示
      flash.now[:alert] = "返信に失敗しました"
      render "posts/show", status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:name, :content)
  end
end
