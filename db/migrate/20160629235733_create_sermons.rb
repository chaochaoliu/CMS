class CreateSermons < ActiveRecord::Migration
  def change
    create_table :sermons do |t|
      t.string :title
      t.string :scripture
      t.datetime :date
      t.string :preacher
      t.text :content
      t.integer :category

      t.timestamps null: false
    end
  end
end
