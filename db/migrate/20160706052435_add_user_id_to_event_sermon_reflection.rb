class AddUserIdToEventSermonReflection < ActiveRecord::Migration
  def change
    add_column :event_sermon_reflections, :user_id, :integer
  end
end
