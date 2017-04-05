class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.references :team, index: true, foreign_key: true
      t.references :activity_instance, index: true, foreign_key: true

      t.boolean :accepted, default: false
      t.boolean :rejected, default: false

      t.text :notes

      t.timestamps null: false
    end
  end
end
