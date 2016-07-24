class AddImageToNotification < ActiveRecord::Migration
 def change
    add_column :notifications, :image, :string
  end
end
