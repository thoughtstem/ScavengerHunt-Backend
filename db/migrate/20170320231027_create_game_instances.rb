class CreateGameInstances < ActiveRecord::Migration
  def change
    create_table :game_instances do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
