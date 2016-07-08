class AddApprovedToRegistration < ActiveRecord::Migration
def self.up
    add_column :registrations, :approved?, :boolean
  end

  def self.down
    remove_column :registrations, :approved?
  end
end
