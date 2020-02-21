ActiveAdmin.register Dog do
  NOT_DISPLAY_COLS = %i[description created_at updated_at]

  permit_params :id, :name, :mother_id, :father_id, :sex, :color_type, :living_address, :description,
    :slug, :date_of_birth, :date_of_death, photos_attributes: %i[id title alt image _destroy]

  index do
    selectable_column
    Dog.column_names.reject{ |col| NOT_DISPLAY_COLS.include?(col.to_sym) }.map(&:to_sym).each do |col|
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
    actions
  end

  form html: { multipart: true } do |f|
    f.inputs do
      Dog.column_names.map(&:to_sym).each do |column|
        next if %i[id slug created_at updated_at].include?(column)
        if column == :mother_id
          f.input :mother_id, as: :select, collection: Dog.female.map { |v| [v.name, v.id] }.to_h
          next
        end
        if column == :father_id
          f.input :father_id, as: :select, collection: Dog.female.map { |v| [v.name, v.id] }.to_h
          next
        end
        f.input column
      end
    end
    f.inputs 'Photos' do
      f.has_many :photos, heading: false, allow_destroy: true do |ff|
        ff.input :image, as: :file, input_html: { accept: 'image/*' }, 
          hint: ff.object.image.present? ? image_tag(ff.object.image.url, style: 'height:auto; max-width: 500px;') : ''
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
        row col
      end
    end

    panel "Photos" do
      dog.photos.map do |photo|
        div do
          image_tag photo.image.url, style: 'max-width: 800px; height: auto;'
        end
        br
      end
    end
  end
end
