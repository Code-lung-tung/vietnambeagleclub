ActiveAdmin.register Pack do
  permit_params do
    Pack.column_names.map(&:to_sym)
  end

  index do
    selectable_column
    id_column
    column :title
    column :status do |pack|
      status_tag pack.status
    end
    column :display_order
    column :created_at
    column :updated_at
    actions
  end

  filter :title
  filter :status, as: :select, collection: Pack.statuses

  form html: { multipart: true } do |f|
    f.inputs do
      Pack.column_names.map(&:to_sym).each do |column|
        next if %i[id created_at updated_at].include?(column)
        f.input column
      end
    end
    f.actions
  end
  
  show do
    attributes_table do
      Pack.column_names.map(&:to_sym).each do |column|
        if column == :status
          row column do |pack|
            status_tag pack.status
          end
          next
        end
        row column
      end
    end
  end
end
