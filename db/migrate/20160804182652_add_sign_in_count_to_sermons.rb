class AddSignInCountToSermons < ActiveRecord::Migration
 def change
    add_column :sermons, :sign_in_count, :integer
    add_column :event_sermons, :sign_in_count, :integer
  end
end
