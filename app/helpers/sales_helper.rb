module SalesHelper
    def format_sale(price, price_dow)
      format = "";
      if (!price_dow.nil?) 
        format = 
          "#{format_money(price_dow)} đ
          <span>#{format_money(price)} đ</span>"
      else
        format = 
          "#{format_money(price)} đ"
      end
      format.html_safe
    end

    def format_money(price)
      price.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    end
end
