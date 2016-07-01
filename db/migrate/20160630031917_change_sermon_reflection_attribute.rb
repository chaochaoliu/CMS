class ChangeSermonReflectionAttribute < ActiveRecord::Migration
  def change
    change_column :sermon_reflections, :content,  :text
    add_column :sermon_reflections, :public?,  :boolean
  end
end
