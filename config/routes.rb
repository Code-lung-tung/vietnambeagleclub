Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/search', to: 'search#index'
  get '/details/:id', to: 'search#details', as: :details
  get '/bai-viet-moi', to: 'articles#index'

  get '/:slug', to: 'home#show'
  get '/portfolio/:id', to: 'dogs#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/tinymce_assets' => 'tinymce_assets#create'
end
