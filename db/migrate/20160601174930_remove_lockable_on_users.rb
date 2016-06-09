class RemoveLockableOnUsers < ActiveRecord::Migration
  def change
    remove_column :users, :locked_at
  end
end
