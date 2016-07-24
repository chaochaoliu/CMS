class AddTitleAndNameToSermonReflection < ActiveRecord::Migration
 def change
    add_column :sermon_reflections, :title, :string
    add_column :sermon_reflections, :name, :string
    add_column :event_sermon_reflections, :title, :string
  end
end
