class Sermon < ActiveRecord::Base
  extend Enumerize
  has_many :sermon_reflections

  enumerize :category, in: {"Sunday Service" => 1, 
                            "Morning Service" => 2 , 
                            "Prayer Meeting" => 3,
                       "Wednesday Evening Service" => 4}, default: "Morning Service"
end
