class SearchController < ApplicationController
  def index
    @q = Dog.ransack(params[:q])
    @dogs = @q.result(distinct: true).page(params[:page]).per(1)
  end
end
