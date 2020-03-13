module SalesHelper
    def format_sale(price, sale_price)
      format = "";
      if (sale_price.present?) 
        format = 
          "<strike>#{format_money(sale_price)} <u>đ</u></strike>
          <span><b>#{format_money(price)} <u>đ</u></b></span>"
      else
        format = 
          "#{format_money(price)} <u>đ</u>"
      end
      format.html_safe
    end

    def format_money(price)
      price.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    end
end
