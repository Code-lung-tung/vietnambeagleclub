class ArticlesController < ApplicationController
  def index
    @articles = Article.published.order(created_at: :desc)
  end

  def show
    
  end
end
