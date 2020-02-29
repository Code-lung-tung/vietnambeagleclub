class SearchController < ApplicationController
  def index
    fromdate = validate_date(params[:fromdate]) ? Date.strptime(params[:fromdate], '%d-%m-%Y') : ''
    todate = validate_date(params[:todate]) ? Date.strptime(params[:todate], '%d-%m-%Y') : ''
    @dogs = Dog.by_id(params[:id]).by_name(params[:name]).by_sex(params[:sex]).\
       by_color(params[:color]).by_date(fromdate, todate).\
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

  def validate_date(str)
    format_ok = str.match(/\d{2}-\d{2}-\d{4}/) if str.presence
    parseable = Date.strptime(string, '%d-%m-%Y') rescue false
    true if format_ok && parseable
    false
  end
end
