class SearchController < ApplicationController
  def index
    @dogs = Dog.by_id(params[:id]).by_name(params[:name]).by_sex(params[:sex]).\
       by_color(params[:color]).by_date(params[:fromdate], params[:todate]).\
       order_by_field(params_order(params[:ordby])).page(params[:page]).per(1)
  end

  private 

  def params_order(field)
    case field
    when 0
      name
    when 1
      date_of_birth
    when 2
      updated_at
    when 3
      created_at
    else
      ''
    end
  end
end
