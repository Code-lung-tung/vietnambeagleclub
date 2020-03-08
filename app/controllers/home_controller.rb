class HomeController < ApplicationController
  def index 
    @articles = Article.published.order(created_at: :desc).page params[:page]
    @dogs = Dog.male.page
    @services = Service.active.all.order :display_order
    @sales = Sale.order(created_at: :desc).page params[:page]    
  end

  def show
    @article = Article.published.find_by(slug: params[:slug])
    @last_article = Article.last
  end

  def service
  end
end
