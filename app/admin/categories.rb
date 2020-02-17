ActiveAdmin.register Category do
  permit_params do
    Category.column_names.map(&:to_sym).reject { |c| c == :slug }
  end

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :slug
    column :status
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      Category.column_names.map(&:to_sym).each do |column|
        next if %i[id slug created_at updated_at].include?(column)
        f.input column
      end
    end
    f.actions
  end
end
