ActiveAdmin.register Track do

  index do
    column :id
    column :name
    column :release_id
    column :user
    actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :soundcloud_link
      row :beatport_link
      row :date
      row :release
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :soundcloud_link
      f.input :beatport_link
      f.input :release_id, :as => :select, :collection => Release.all, :include_blank => false, :require => true
    end
    f.actions
  end

end
