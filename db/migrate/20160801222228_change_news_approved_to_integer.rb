class ChangeNewsApprovedToInteger < ActiveRecord::Migration
  def up
    remove_column :news, :approved?
    add_column :news, :approved, :integer
  end

  def down
    add_column :news, :approved?, :boolean
    remove_column :news, :approved
  end
end
