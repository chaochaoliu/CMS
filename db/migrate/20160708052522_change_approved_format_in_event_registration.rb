class ChangeApprovedFormatInEventRegistration < ActiveRecord::Migration
  def up
    remove_column :event_registrations, :approved?
    add_column :event_registrations, :approved, :integer
  end

  def down
    add_column :event_registrations, :approved?, :boolean
    remove_column :event_registrations, :approved
  end
end
