class HomeController < ApplicationController
  def index 
    @articles = Article.published.order(created_at: :desc).page params[:page]
    @dogs = Dog.by_male.page params[:page]
    @services = Service.active.all.order :display_order
  end

  def show
    @article = Article.published.find_by(slug: params[:slug])
    @last_article = Article.last
  end

  def service
  end
end
