ActiveAdmin.register ActivityInstance do
  permit_params :activity_instance_id, :game_instance_id, :name, :prompt_url, :completed, :image


  show do
    attributes_table do
      row :name
      row :prompt_url
      row :completed

      row :game_instance

      row :activity_instance

      row :image do |ad|
        image_tag ad.image.url, width: 200
      end
    end

    active_admin_comments
  end


  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :game_instance
      f.input :activity_instance
      f.input :prompt_url
      f.input :completed
    end

    f.inputs "Clue Image" do
      f.input :image, required: true, as: :file
    end
    f.actions
  end
end
