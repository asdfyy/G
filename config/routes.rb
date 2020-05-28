Rails.application.routes.draw do
  get 'userinfos/show'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
#   devise_scope :user do
#     get 'signup1', to: 'users/registrations#signup1'
#     get 'signup2', to: 'users/registrations#signup2'
#   end
devise_scope :user do
  get 'addresses', to: 'users/registrations#new2'
  post 'addresses', to: 'users/registrations#create_address'
end

  root 'toppage#index'
  get "/tyannko" => "toppage#tyannko"
end




