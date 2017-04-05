ActiveAdmin.register Submission do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 
 permit_params :completed, :team_id, :activity_instance_id, :accepted, :rejected, :notes

# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  show do
    attributes_table do
      row :team
      row :activity_instance

      row :accepted
      row :rejected

      row :notes

      row :image do |ad|
        image_tag ad.image.url
      end
    end

    active_admin_comments
  end

end
