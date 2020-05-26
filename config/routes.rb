Rails.application.routes.draw do
  devise_for :users, controllers: {
    # sessions: 'users/sessions',
    # registrations: "users/registrations",
  }
  devise_scope :user do
    get 'signup1', to: 'users/registrations#step1'
    get 'signup2', to: 'users/registrations#step2'
  end
# devise_scope :user do
#   get 'addresses', to: 'users/registrations#new2'
#   post 'addresses', to: 'users/registrations#create_address'
# end

  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'done' # 登録完了後のページ
    end
  end
  
  root 'toppage#index'
  get "/tyannko" => "toppage#tyannko"
end




