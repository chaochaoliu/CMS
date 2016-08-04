class DeleteRemainingReservationInEvents < ActiveRecord::Migration
  def up
    remove_column :events, :remaining_reservations
  end

  def down
    add_column :events, :remaining_reservations, :integer
  end
end
