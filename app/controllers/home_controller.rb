class HomeController < ApplicationController
  def index 
    @articles = Article.active.order(created_at: :desc).page params[:page]
    @dogs = Dog.by_male.page params[:page]
  end

  def show
    @article = Article.find_by(slug: params[:slug])
    @last_article = Article.last
  end

  def service
  end
end
