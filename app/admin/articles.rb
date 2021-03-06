ActiveAdmin.register Article do
  permit_params do
    Article.column_names.map(&:to_sym)
  end

  index do
    selectable_column
    id_column
    column :title
    column :photo do |article|
      image_tag article.photo.thumb.url
    end
    column :slug
    column :status do |article|
      status_tag article.status
    end
    column :published_date
    actions
  end

  filter :title
  filter :slug
  filter :status, as: :select, collection: Article.statuses
  filter :category

  form html: { multipart: true } do |f|
    f.inputs do
      Article.column_names.map(&:to_sym).each do |column|
        next if %i[id slug category created_at updated_at].include?(column)
        if column == :photo
          f.input :photo, as: :file, input_html: { accept: 'image/*' }
          next
        end
        if column == :content
          f.input :content, input_html: { class: 'editor' }
          next
        end
        if column == :published_date
          f.input :published_date, as: :date_picker
          next
        end
        f.input column
      end
    end
    f.actions
  end
  
  show do
    attributes_table do
      Article.column_names.map(&:to_sym).each do |column|
        if column == :photo
          row column do |article|
            image_tag article.photo.url, style: 'height:auto; max-width: 500px;'
          end
          next
        end
        if column == :category
          next
        end
        if column == :content
          row column do |article|
            strip_tags article.content
          end
          next
        end
        if column == :status
          row column do |article|
            status_tag article.status
          end
          next
        end
        row column
      end
    end
  end
end
