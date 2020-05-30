Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
devise_scope :user do
  get 'addresses', to: 'users/registrations#new2'
  post 'addresses', to: 'users/registrations#create_address'
end


  get 'userinfos/show'
  get 'alluserinfo/index'
  root 'toppage#index'
  get "/tyannko" => "toppage#tyannko"
end




