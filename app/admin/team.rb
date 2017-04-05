ActiveAdmin.register Team do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :game_instance_id, :name
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
 

  index do
    id_column
    column :game_instance
    column :number_of_players
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :game_instance

      panel "Players" do
        table_for team.players do
          column "name" do |player|
            link_to player.name, admin_player_path(player)
          end
        end
      end

    end

    active_admin_comments
  end
end
