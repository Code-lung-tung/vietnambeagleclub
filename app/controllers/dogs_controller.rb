class DogsController < ApplicationController
  def index
  end

  def show
    @dog = Dog.includes(:photos).find(params[:id])
  end
end
