class AddStatusToNewsAndSermonAndEvents < ActiveRecord::Migration
 def change
    add_column :sermons, :status, :integer
    add_column :news, :status, :integer
    add_column :events, :status, :integer
  end
end
