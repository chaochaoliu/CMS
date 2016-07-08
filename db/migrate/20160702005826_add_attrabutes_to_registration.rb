class AddAttrabutesToRegistration < ActiveRecord::Migration
 def self.up
    add_column :registrations, :applicant_name, :string
    add_column :registrations, :application_reason, :text
  end

  def self.down
    remove_column :registrations, :applicant_name
    remove_column :registrations, :application_reason
  end
end
