class ChangeSermonReflectionPrivacy < ActiveRecord::Migration
  def up
    remove_column :sermon_reflections, :public?
    add_column :sermon_reflections, :privacy_level, :integer
  end

  def down
    add_column :sermon_reflections, :public?, :boolean
    remove_column :sermon_reflections, :privacy_level
  end
end
