class ChangePreacherToPreacherId < ActiveRecord::Migration
  def up
     remove_column :sermons, :preacher
     remove_column :event_sermons, :preacher

     change_table :sermons do |t|
       t.belongs_to :preacher
     end

     change_table :event_sermons do |t|
       t.belongs_to :preacher
     end
  end
end
