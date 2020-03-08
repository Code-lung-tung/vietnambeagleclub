class SalesController < ApplicationController
  def index
    @sales = Sale.order(created_at: :desc).page params[:page] 
  end

  def show
    @sale = Sale.find_by(slug: params[:slug])
  end
end
