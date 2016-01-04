ActiveAdmin.register Styling do

  index do
    column :id
    column :name
    column :category_id
    column :user
    actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :description
      row :location
      row :date
      row :category
      p.images.each do |image|
        row :image do
          image_tag(image.file.url(:thumb))
        end
      end
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :name, :require => true
      f.input :description
      f.input :location
      f.input :date
      f.input :category_id, :as => :select, :collection => Category.all, :include_blank => false, :require => true
    end
    f.inputs "Images" do
      f.has_many :images do |i|
        i.input :file, as: :file, label: false, hint: i.object.new_record? ? i.template.content_tag(:span, "No Image Yet") : image_tag(i.object.file.url(:thumb))
        i.input :cover, as: :boolean, label: "Cover"
        i.input :year
        i.input :_destroy, as: :boolean, label: "Destroy?" unless i.object.new_record?
      end 
    end
    f.actions
  end


end
