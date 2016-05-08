class Profile < ActiveRecord::Base
  extend Enumerize

  belongs_to :user

  enumerize :student_status, in: {"F1" => 1, 
                          "F2" => 2 , 
                          "H1B" => 3,
                          "Others" => 4}, default: "F1"

  enumerize :gender, in: {"Male" => 1, 
                          "Female" => 2 , 
                          }, default: "Female"


  enumerize :faith_status, in: {"Pastor" => 1, 
                          
                          "Regular Member" => 2}, default: "Regular Member"

  enumerize :marital_status, in: {"Married" => 1, 
                          "Single" => 2 , 
                          "Pregnant" => 3,
                          }, default: "Single"

  enumerize :nationality, in: {"China" => 1, 
                          "Korea" => 2 , 
                          "Others" => 3,
                          }, default: "China"
end
