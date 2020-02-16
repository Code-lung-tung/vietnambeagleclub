ActiveAdmin.register Category do
  permit_params do
    %i[id name description slug status]
  end
end
