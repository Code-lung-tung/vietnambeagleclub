Rails.application.routes.draw do
  get 'sales/index'
  root to: 'sales#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self) rescue ActiveAdmin::DatabaseHitDuringLoad
  get '/search', to: 'search#index'
  get '/details/:id', to: 'search#details', as: :details
  get '/details/:id/relative', to: 'search#relative', as: :relative
  get '/details/:id/descendant', to: 'search#descendant', as: :descendant
  get '/details/:id/genealogy', to: 'search#genealogy', as: :genealogy
  get '/details/:id/genealogy-result', to: 'search#genealogy_result', as: :genealogy_result
  
  get '/bai-viet-moi', to: 'articles#index', as: :articles
  get '/danh-muc/dang-ban', to: 'sales#index'
  get '/san-pham/:slug', to: 'sales#show', as: :sale

  get '/bai-viet/:slug', to: 'articles#show', as: :article
  get '/portfolio/:id', to: 'dogs#show', as: :portfolio
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/tinymce_assets' => 'tinymce_assets#create'
end
