class CreateActivityInstances < ActiveRecord::Migration
  def change
    create_table :activity_instances do |t|
      t.string :name
      t.string :prompt_url
      t.boolean :completed, default: false
      t.references :activity_instance, index: true, foreign_key: true
      t.references :game_instance,     index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
