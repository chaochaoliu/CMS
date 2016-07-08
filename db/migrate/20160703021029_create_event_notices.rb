class CreateEventNotices < ActiveRecord::Migration
  def change
    create_table :event_notices do |t|
      t.string :title
      t.text :content
      t.string :publisher
      t.belongs_to :event

      t.timestamps null: false
    end
  end
end
