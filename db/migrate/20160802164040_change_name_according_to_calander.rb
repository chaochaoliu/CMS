class ChangeNameAccordingToCalander < ActiveRecord::Migration
  def self.up
    rename_column :event_sermons, :sermon_date, :start_time
    rename_column :sermons, :date, :start_time
    rename_column :events, :name, :title
  end

  def self.down
    rename_column :event_sermons, :start_time, :sermon_date
    rename_column :sermons, :start_time, :date
    rename_column :events, :title, :name
  end
end
