ActiveAdmin.register Article do
  permit_params do
    Article.column_names.map(&:to_sym)
  end

  index do
    selectable_column
    id_column
    column :title
    column :photo
    column :category_id
    column :slug
    column :status
    column :published_at
    column :created_at
    column :updated_at
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
          f.input :photo, as: :file
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
