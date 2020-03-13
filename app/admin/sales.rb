ActiveAdmin.register Sale do
  permit_params do
    Sale.column_names.map(&:to_sym)
  end

  index do
    selectable_column
    column :id
    column :microchip_number do |sale|
      link_to sale.dog.microchip_number, admin_dog_path(sale.dog) if sale.dog&.microchip_number?
    end
    column :dog_id do |sale|
      link_to sale.dog.name, admin_dog_path(sale.dog) if sale.dog.present?
    end
    column :pack do |sale|
      link_to sale.dog.pack.title, admin_pack_path(sale.dog.pack) if sale.dog&.pack
    end
    column :price do |sale|
      number_to_currency sale&.price, unit: 'VNĐ', delimiter: '.', precision: 0, format: "%n %u"
    end
    column :sale_price do |sale|
      number_to_currency sale&.sale_price, unit: 'VNĐ', delimiter: '.', precision: 0, format: "%n %u"
    end
    column :status do |sale|
      status_tag sale.status
    end
    actions
  end

  filter :dog_id, as: :select, collection: Dog.all.map { |v| [v.name, v.id] }.to_h
  filter :price
  filter :sale_price
  filter :status, as: :select, collection: Sale.statuses.to_a.map { |arr| [I18n.t("enum.#{arr[0]}"), arr[1]]  }

  form html: { multipart: true } do |f|
    f.input :dog_id, as: :select, collection: Dog.all.map { |d| [d.name, d.id] }.to_h
    f.inputs do
      Sale.column_names.map(&:to_sym).each do |column|
        next if %i[id dog_id created_at updated_at].include?(column)
        f.input column
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row 'Microchip' do |sale|
        link_to sale.dog.microchip_number, admin_dog_path(sale.dog)
      end
      row 'Cún' do |sale|
        link_to sale.dog.name, admin_dog_path(sale.dog)
      end
      row 'Bố' do |sale|
        link_to sale.dog.father.name, admin_dog_path(sale.dog.father) if sale.dog.father
      end
      row 'Mẹ' do |sale|
        link_to sale.dog.mother.name, admin_dog_path(sale.dog.mother) if sale.dog.mother
      end
      row 'Giới tính' do |sale|
        status_tag sale.dog.sex
      end
      row 'Màu lông' do |sale|
        status_tag sale.dog.color_type
      end
      Sale.show_column_names.each do |col|
        next if col == :id
        if %i[price sale_price].include?(col)
          row col do |sale|
            number_to_currency sale.send(col), unit: 'VNĐ', delimiter: '.', precision: 0, format: "%n %u"
          end
          next
        end
        if col == :status
          row col do |sale|
            status_tag sale.status
          end
          next
        end
        row col
      end
    end
  end
end
