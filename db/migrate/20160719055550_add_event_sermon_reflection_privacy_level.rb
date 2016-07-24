class AddEventSermonReflectionPrivacyLevel < ActiveRecord::Migration
  def up
    add_column :event_sermon_reflections, :privacy_level, :integer
  end

  def down
    remove_column :event_sermon_reflections, :privacy_level
  end
end
