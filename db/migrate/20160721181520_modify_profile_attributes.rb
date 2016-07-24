class ModifyProfileAttributes < ActiveRecord::Migration
  def up
    remove_column :profiles, :i20_expire_date
    remove_column :profiles, :visa_type
    remove_column :profiles, :house_leader
    remove_column :profiles, :self_description
    remove_column :profiles, :home_town
    remove_column :profiles, :is_house_leader

    add_column :profiles, :hobby, :string
  end

  def down
    add_column :profiles, :i20_expire_date, :datetime
    add_column :profiles, :visa_type, :integer
    add_column :profiles, :house_leader, :string
    add_column :profiles, :self_description, :text
    add_column :profiles, :home_town, :string
    add_column :profiles, :is_house_leader, :integer
    remove_column :profiles, :hobby
  end
end
