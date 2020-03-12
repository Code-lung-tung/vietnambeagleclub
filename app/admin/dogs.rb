ActiveAdmin.register Dog do
  permit_params :id, :name, :mother_id, :father_id, :sex, :color_type, :living_address, :description,
    :microchip_number, :owner, :slug, :date_of_birth, :date_of_death, :pack_id,
    photos_attributes: %i[id title alt image _destroy],
    sale_attributes: %i[id price sale_price _destroy]

  index do
    selectable_column
    Dog.index_ordered_column_names.each do |col|
      if col == :mother_id
        column col do |dog|
          link_to dog.mother.name, admin_dog_path(dog.mother) if dog.mother
        end
        next
      end
      if col == :father_id
        column col do |dog|
          link_to dog.father.name, admin_dog_path(dog.father) if dog.father
        end
        next
      end
      column col
    end
    column 'Giá' do |dog|
      number_to_currency dog&.sale&.price, unit: 'VNĐ', delimiter: '.', precision: 0, format: "%n %u"
    end
    column 'Giá sale' do |dog|
      number_to_currency dog&.sale&.sale_price, unit: 'VNĐ', delimiter: '.', precision: 0, format: "%n %u"
    end
    actions
  end

  filter :name
  filter :pack
  filter :mother
  filter :father
  filter :date_of_birth
  filter :date_of_death
  filter :sex, as: :select, collection: Dog.sexes
  filter :color_type, as: :select, collection: Dog.color_types
  filter :microschip_number
  filter :owner
  filter :living_address

  form html: { multipart: true } do |f|
    f.inputs do
      Dog.ordered_column_names.map(&:to_sym).each do |column|
        next if %i[id slug created_at updated_at].include?(column)
        if column == :pack_id
          f.input column, as: :select, collection: Pack.all.map { |p| [p.title, p.id] }.to_h
          next
        end
        if column == :mother_id
          f.input column, as: :select, collection: Dog.not_this_one(dog).female.map { |v| [v.name, v.id] }.to_h
          next
        end
        if column == :father_id
          f.input column, as: :select, collection: Dog.not_this_one(dog).male.map { |v| [v.name, v.id] }.to_h
          next
        end
        if column == :description
          f.input :description, input_html: { class: 'editor' }
          next
        end
        f.input column
      end
    end
    f.inputs "Thông tin đang bán" do
      f.has_many :sale, heading: false, allow_destroy: true do |ff|
        ff.input :price
        ff.input :sale_price
      end
    end
    f.inputs "Ảnh" do
      f.has_many :photos, heading: false, allow_destroy: true do |ff|
        ff.input :image, as: :file, input_html: { accept: "image/*" }, 
          hint: ff.object.image.present? ? image_tag(ff.object.image.url, style: "height:auto; max-width: 500px;") : ""
        ff.input :title
        ff.input :alt
      end
    end
    f.actions
  end

  show do
    attributes_table do
      Dog.column_names.map(&:to_sym).each do |col|
        next if col == :id
        if col == :mother_id
          row col do |dog|
            link_to dog.mother.name, admin_dog_path(dog.mother) if dog.mother
          end
          next
        end
        if col == :father_id
          row col do |dog|
            link_to dog.father.name, admin_dog_path(dog.father) if dog.father
          end
          next
        end
        if col == :pack_id
          row col do |dog|
            link_to dog.pack.title, admin_pack_path(dog.pack) if dog.pack
          end
          next
        end
        row col
      end
    end

    panel "Thông tin đang bán" do
      attributes_table_for dog.sale do
        row :price do |sale|
          number_to_currency sale.price, unit: 'VNĐ', delimiter: '.', precision: 0, format: "%n %u"
        end
        row :sale_price do |sale|
          number_to_currency sale.sale_price, unit: 'VNĐ', delimiter: '.', precision: 0, format: "%n %u"
        end
        row :description
      end
    end

    panel "Ảnh" do
      dog.photos.map do |photo|
        div do
          image_tag photo.image.url, style: 'max-width: 800px; height: auto;'
        end
        br
      end
    end
  end
end
