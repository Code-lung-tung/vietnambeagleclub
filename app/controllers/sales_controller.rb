class SalesController < ApplicationController
  def index
    @packs = Pack.active.joins(dogs: :sale).merge(Sale.in_stock).order(:display_order, created_at: :desc)
  end

  def show
    @sale = Dog.find_by(slug: params[:slug])
  end
end
