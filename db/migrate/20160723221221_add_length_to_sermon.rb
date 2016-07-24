class AddLengthToSermon < ActiveRecord::Migration
 def change
    add_column :sermons, :length, :string
    add_column :event_sermons, :length, :string
  end
end
