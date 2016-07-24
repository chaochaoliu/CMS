class AddSendToToSuggestions < ActiveRecord::Migration
  def up
    add_column :suggestions, :send_to, :integer
  end

  def down
    remove_column :suggestions, :send_to
  end
end
