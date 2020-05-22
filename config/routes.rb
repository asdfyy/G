Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root 'toppage#index'
  get "/tyannko" => "toppage#tyannko"
end
