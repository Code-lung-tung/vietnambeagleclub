class HomeController < ApplicationController
  def index 
  
  end

  def test
    respond_to do |format|
      format.js
      format.html
    end 
  end
end
