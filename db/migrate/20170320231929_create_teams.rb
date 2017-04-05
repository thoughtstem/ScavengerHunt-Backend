class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :player, index: true, foreign_key: true
      t.references :game_instance, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
