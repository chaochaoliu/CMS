class ChangeChurchEmailPositionDataType < ActiveRecord::Migration
  def up
    change_column :church_emails, :position, :integer
  end

  def down
    change_column :church_emails, :position, :string
  end
end
