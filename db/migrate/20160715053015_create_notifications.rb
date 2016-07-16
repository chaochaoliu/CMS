class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title
      t.text :content
      t.string :publisher
      t.datetime :publish_date

      t.timestamps null: false
    end
  end
end
