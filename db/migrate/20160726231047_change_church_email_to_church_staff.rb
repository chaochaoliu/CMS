class ChangeChurchEmailToChurchStaff < ActiveRecord::Migration
  def change
    add_column  :church_staffs, :name, :string
  end
end
