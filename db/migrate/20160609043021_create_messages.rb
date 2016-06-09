class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.string :to
      t.string :cc
      t.string :bcc
      t.text :content
      t.string :attachment

      t.timestamps null: false
    end
  end
end
