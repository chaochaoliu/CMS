class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string   :full_name
      t.datetime :date_of_birth
      t.integer  :gender                  
      t.string   :mobile                   
      t.string   :address               
      t.datetime :time_to_become_member
      t.integer  :visa_type           
      t.datetime :i20_expire_date
      t.string   :house_leader
      t.string   :group_leader
      t.string   :emergency_contact_person
      t.text     :self_description       
      t.integer  :faith_level            
      t.integer  :marital_status           
      t.string   :nationality 
      t.string   :family_member
      t.integer  :user_id

      t.timestamps null: false
    end
    add_index :profiles, :user_id,                unique: true

  end
end
