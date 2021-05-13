Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:create, :index] # orderとのネスト（親子関係を作る）
  end
end
