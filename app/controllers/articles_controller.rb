class ArticlesController < ApplicationController
  def index
    @articles = Article.active.order(created_at: :desc)
  end

  def show
    
  end
end
