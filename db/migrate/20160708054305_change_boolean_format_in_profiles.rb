class ChangeBooleanFormatInProfiles < ActiveRecord::Migration
  def up
    change_column :profiles, :house_leader, :string

    remove_column :profiles, :house_leader?
    remove_column :profiles, :group_leader?
    remove_column :profiles, :pastor?
    
    add_column :profiles, :is_house_leader, :integer
    add_column :profiles, :is_group_leader, :integer
    add_column :profiles, :is_pastor, :integer

  end

  def down
    change_column :profiles, :house_leader, :boolean
    
    remove_column :profile, :is_house_leader
    remove_column :profile, :is_group_leader
    remove_column :profile, :is_pastor

    add_column :profiles, :house_leader?, :boolean
    add_column :profiles, :group_leader?, :boolean
    add_column :profiles, :pastor?, :boolean

  end
end
