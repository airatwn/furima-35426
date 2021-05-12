Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :order, only: :create # orderとのネスト（親子関係を作る）
  end
end
