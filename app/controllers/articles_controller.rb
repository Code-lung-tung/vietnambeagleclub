class ArticlesController < ApplicationController
  def index
    @articles = Article.published.normal.order(created_at: :desc).page(params[:page]).per(10)
  end

  def experience
    @articles = Article.published.experience.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @article = Article.published.find_by(slug: params[:slug])
    @last_article = Article.last
  end
end
