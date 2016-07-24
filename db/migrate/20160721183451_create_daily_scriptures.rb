class CreateDailyScriptures < ActiveRecord::Migration
  def change
    create_table :daily_scriptures do |t|
      t.string :title
      t.text :content
      t.datetime :publish_date

      t.timestamps null: false
    end
  end
end
