Rails.application.routes.draw do
  get 'sales/index'
  get 'sales/show'
  root to: 'home#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/search', to: 'search#index'
  get '/details/:id', to: 'search#details', as: :details
  get '/details/:id/relative', to: 'search#relative', as: :relative
  get '/details/:id/descendant', to: 'search#descendant', as: :descendant
  get '/details/:id/genealogy', to: 'search#genealogy', as: :genealogy
  get '/details/:id/genealogy-result', to: 'search#genealogy_result', as: :genealogy_result
  
  get '/bai-viet-moi', to: 'articles#index'
  get '/chia-se-kinh-nghiem', to: 'shares#index'
  get '/danh-muc/dang-ban', to: 'sales#index'
  get '/san-pham/:slug', to: 'sales#show'

  get '/:slug', to: 'home#show'
  get '/portfolio/:id', to: 'dogs#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/tinymce_assets' => 'tinymce_assets#create'
end
