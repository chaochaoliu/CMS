class AddContactPersonToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :home_town_contact_person,  :string
    add_column :profiles, :home_town_contact_person_phone, :string

  end
end
