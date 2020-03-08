class ArticlesController < ApplicationController
  def index
    @articles = Article.published.write.order(created_at: :desc)
  end

  def show
    
  end
end
