ActiveAdmin.register SiteSetting do
  actions :all, except: %i[destroy create show]

  permit_params :id, :value, :status,
    banners_attributes: %i[id title status alt link image _destroy],
    services_attributes: %i[id title status content image display_order _destroy]

  index do
    selectable_column
    id_column
    column :setting_type do |s|
      s.setting_type.humanize
    end
    column :value do |s|
      strip_tags s.value
    end
    column :status do |s|
      status_tag s.status
    end
    column :updated_at
    actions
  end

  filter :setting_type, as: :select, collection: SiteSetting.setting_types
  filter :status, as: :select, collection: SiteSetting.statuses

  form do |f|
    f.inputs do
      SiteSetting.column_names.map(&:to_sym).each do |column|
        next if %i[id created_at updated_at].include?(column)
        if column == :setting_type
          f.input column, input_html: { disabled: true }
          next
        end
        if column == :value && !f.object.banner? && !f.object.service?
          f.input column, input_html: { class: f.object.google_map? ? '' : 'editor' }
          next
        end
      end
    end
    if f.object.banner?
      f.has_many :banners, heading: false, allow_destroy: true do |ff|
        ff.input :image, as: :file, input_html: { accept: 'image/*' },
          hint: ff.object.image.present? ? image_tag(ff.object.image.url, style: 'height:auto; max-width: 500px;') : ''
        ff.input :status
        ff.input :link
        ff.input :title
        ff.input :alt
      end
    end
    if f.object.service?
      f.has_many :services, heading: false, allow_destroy: true do |ff|
        ff.input :title
        ff.input :image, as: :file, input_html: { accept: 'image/*' },
          hint: ff.object.image.present? ? image_tag(ff.object.image.url, style: 'height:auto; max-width: 500px;') : ''
        ff.input :status
        ff.input :display_order
        ff.input :content, input_html: { class: 'editor' }
      end
    end
    f.actions
  end
end
