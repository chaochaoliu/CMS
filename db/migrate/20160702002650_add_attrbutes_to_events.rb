class AddAttrbutesToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :ministry, :string
    add_column :events, :max_number_of_people, :string
    add_column :events, :target_people, :string
    add_column :events, :remaining_reservations, :integer
    add_column :events, :deadline_of_appication, :datetime

  end

  def self.down
    remove_column :events, :ministry
    remove_column :events, :max_number_of_people
    remove_column :events, :target_people
    remove_column :events, :remaining_reservations
    remove_column :events, :deadline_of_appication
  end
end
