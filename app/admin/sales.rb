ActiveAdmin.register Sale do
  permit_params :id, :title, :price, :price_dow, :description, photos_attributes: %i[id title alt image _destroy]

  index do
    selectable_column
    column :title
    column :price
    column :price_dow
    column :description
    actions
  end

  filter :title
  filter :price
  filter :price_dow
  filter :description

  form html: { multipart: true } do |f|
    f.inputs do
      Sale.column_names.map(&:to_sym).each do |column|
        next if %i[id created_at updated_at].include?(column)
        f.input column
      end
    end
    f.inputs 'Ảnh' do
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
      Sale.column_names.map(&:to_sym).each do |col|
        next if col == :id
        row col
      end
    end

    panel "Photos" do
      sale.photos.map do |photo|
        div do
          image_tag photo.image.url, style: 'max-width: 800px; height: auto;'
        end
        br
      end
    end
  end
end
