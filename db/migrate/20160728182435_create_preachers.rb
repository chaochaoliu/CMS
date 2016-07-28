class CreatePreachers < ActiveRecord::Migration
  def change
    create_table :preachers do |t|
      t.integer :name
      t.string :email

      t.timestamps null: false
    end
  end
end
