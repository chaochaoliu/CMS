class CreateEventSermons < ActiveRecord::Migration
  def change
    create_table :event_sermons do |t|
      t.string :title
      t.string :preacher
      t.datetime :sermon_date
      t.string :content
      t.string :sermon_audio
      t.string :sermon_video
      t.belongs_to :event

      t.timestamps null: false
    end
  end
end
