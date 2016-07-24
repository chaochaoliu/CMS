class RenameCommentsToNewsComments < ActiveRecord::Migration
  def change
    rename_table :comments, :news_comments
  end 

end
