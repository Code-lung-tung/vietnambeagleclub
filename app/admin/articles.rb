ActiveAdmin.register Article do
  permit_params do
    Article.column_names.map(&:to_sym)
  end

  index do
    selectable_column
    id_column
    column :title
    column :photo do |article|
      image_tag article.photo.thumb.url, size: 50
    end
    column :category_id do |article|
      link_to article.category.name, admin_category_path(article.category)
    end
    column :slug
    column :status
    column :published_at
    actions
  end

  form html: { multipart: true } do |f|
    f.inputs do
      Article.column_names.map(&:to_sym).each do |column|
        next if %i[id slug published_at created_at updated_at].include?(column)
        if column == :category_id
          f.input :category_id, as: :select, collection: Category.all.map { |v| [v.name, v.id] }.to_h
          next
        end
        if column == :photo
          f.input :photo, as: :file, input_html: { accept: 'image/*' }
          next
        end
        if column == :content
          f.input :content, input_html: { class: 'editor' }
          next
        end
        f.input column
      end
    end
    f.actions
  end
  
end
