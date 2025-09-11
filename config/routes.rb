Rails.application.routes.draw do
  # トップはタイムライン（投稿一覧）
  root "posts#index"

  # posts の基本ルート（一覧、作成、削除、詳細）
  resources :posts, only: [:index, :new, :create, :show, :destroy] do
    # 投稿に対するコメントは posts/:post_id/comments
    resources :comments, only: [:create]
    # いいね等を追加したいなら member ブロックを使う（今回は省略）
  end

  # 健康チェックなど（省略可）
  get "up" => "rails/health#show", as: :rails_health_check
end
