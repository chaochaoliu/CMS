class AddApprovedToNews < ActiveRecord::Migration
  def self.up
    add_column :news, :approved?, :boolean
  end

  def self.down
    remove_column :news, :approved?
  end
end
