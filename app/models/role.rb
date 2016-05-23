class Role < ActiveRecord::Base
  extend Enumerize

  has_many :users
  validates :name, presence: true
  has_paper_trail


  enumerize :name, in: {"Unapproved" => 1, 
                          "Approved" => 2 , 
                             "Staff" => 3,
                       "Super Admin" => 4}, default: "Unapproved"
  
end
