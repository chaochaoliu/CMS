class AddCategoryToNews < ActiveRecord::Migration
 def self.up
    add_column :news, :category, :integer
  end

  def self.down
    remove_column :news, :category
  end
end
