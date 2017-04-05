ActiveAdmin.register GameInstance do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :name, :description
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  show do
    attributes_table do
      row :name
      row :description

      panel "Teams" do
        table_for game_instance.teams do
          column "name" do |team|
            link_to team.name, admin_team_path(team)
          end
          column "signin qr" do |team|
            render 'common/qr', {url: ENV["HOST"] + "/team_sign_in?team_id=#{team.id}"}
          end
        end
      end

      panel "Activities" do
        table_for game_instance.activity_instances do
          column "name" do |ai|
            link_to ai.name, admin_activity_instance_path(ai)
          end
          column "qr" do |ai|
            render 'common/qr', {url: ENV["HOST"] + "/activity_instances/#{ai.id}"}
          end
          column "clue" do |ai|
           image_tag ai.image.url, width: 200
          end
        end
      end
    end

    active_admin_comments
  end

end
