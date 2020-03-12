module SalesHelper
    def format_sale(price, price_dow)
      format = "";
      if (!price_dow.nil?) 
        format = 
          "<strike>#{format_money(price_dow)} <u>đ</u></strike>
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
