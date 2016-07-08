class RenameRegistrationsToEventRegistrations < ActiveRecord::Migration
  def self.up
    rename_table :registrations, :event_registrations
  end

  def self.down
    rename_table :event_registrations, :registrations
  end
end
