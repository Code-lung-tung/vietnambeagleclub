class SearchController < ApplicationController
  def index
    @q = Dog.ransack(params[:q])
    @dogs = @q.result(distinct: true).page(params[:page]).per(20)
  end

  def details
    @q = Dog.ransack(params[:q])
    @dog = Dog.friendly.find(params[:id])
  end
end
