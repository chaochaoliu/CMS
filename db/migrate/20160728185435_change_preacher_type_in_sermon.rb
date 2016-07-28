class ChangePreacherTypeInSermon < ActiveRecord::Migration
  def up
    change_column :sermons, :preacher, :integer
  end

  def down
    change_column :sermons, :preacher, :string
  end
end
