class SalesController < ApplicationController
  def index
    # @sales = Dog.order(created_at: :desc).page params[:page]
    @sales = Sale.none
  end

  def show
    @sale = Dog.find_by(slug: params[:slug])
  end
end
