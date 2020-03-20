class SalesController < ApplicationController
  def index
    @packs = Pack.active.joins(dogs: :sale).merge(Sale.in_stock).distinct.order(:display_order, created_at: :desc)
  end

  def show
    @dog = Dog.joins(:sale).friendly.find(params[:slug])
  end
end
