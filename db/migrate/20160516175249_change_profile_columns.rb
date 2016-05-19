class ChangeProfileColumns < ActiveRecord::Migration
  def change

    change_column :profiles, :group_leader,  :integer
    change_column :profiles, :house_leader,  :integer

  end
end
