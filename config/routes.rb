Rails.application.routes.draw do
  get 'sales/index'
  get 'sales/show'
  root to: 'home#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/search', to: 'search#index'
  get '/bai-viet-moi', to: 'articles#index'
  get '/chia-se-kinh-nghiem', to: 'shares#index'
  get '/danh-muc/dang-ban', to: 'sales#index'
  get '/san-pham/:slug', to: 'sales#show'

  get '/:slug', to: 'home#show'
  get '/portfolio/:id', to: 'dogs#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/tinymce_assets' => 'tinymce_assets#create'
end
