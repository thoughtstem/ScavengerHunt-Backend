class AddTeamNameToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :name, :string
    remove_column :teams, :player_id

  end
end
