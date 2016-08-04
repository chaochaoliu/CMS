class AddStatusToEventRegistration < ActiveRecord::Migration
  def up
    rename_column :event_registrations, :approved, :status
  end

  def down
    rename_column :event_registrations, :status, :approved
  end
end
