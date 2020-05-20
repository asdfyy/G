Rails.application.routes.draw do
  devise_for :users
  root 'toppage#index'
  get "/tyannko" => "toppage#tyannko"
end
