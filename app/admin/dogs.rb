ActiveAdmin.register Dog do
  NOT_DISPLAY_COLS = %i[description created_at updated_at]

  permit_params do
    Dog.column_names.map(&:to_sym)
  end

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
        next if %i[id created_at updated_at].include?(column)
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
    f.actions
  end
end
