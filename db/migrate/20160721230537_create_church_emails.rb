class CreateChurchEmails < ActiveRecord::Migration
  def change
    create_table :church_emails do |t|
      t.string :position
      t.string :email

      t.timestamps null: false
    end
  end
end
