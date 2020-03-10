class ArticlesController < ApplicationController
  def index
    @articles = Article.published.write.order(created_at: :desc)
  end

  def show
    @article = Article.published.find_by(slug: params[:slug])
    @last_article = Article.last
  end
end
