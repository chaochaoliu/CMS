class DropTableReflections < ActiveRecord::Migration
  def up
    drop_table :reflections
  end

  def down
    create_table :reflections do |t|
      t.integer  :user_id
      t.integer  :event_id
      t.text    :content
    end
  end
end
