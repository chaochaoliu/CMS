class CreateEventSermonReflections < ActiveRecord::Migration
  def change
    create_table :event_sermon_reflections do |t|
      t.string :name
      t.text :content
      t.references :event_sermon, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
