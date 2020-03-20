ActiveAdmin.register Color do
  permit_params do
    Color.column_names.map(&:to_sym)
  end
end
