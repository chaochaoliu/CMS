class ChangePreacherValuesToIntegerInSermon < ActiveRecord::Migration
def up   
    Sermon.find_each do |sermon|
      sermon.preacher = 1
      sermon.save!
    end
  end

  def down
    Sermon.find_each do |sermon|
          sermon.preacher = "P.Jacob"
    end
  end

end
