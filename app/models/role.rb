class Role < ActiveRecord::Base
  extend Enumerize
  has_many :users
  has_paper_trail

  validates :name, presence: true
  validates :description, presence: true

  enumerize :name, in: {"Unapproved" => 1, 
                          "Approved" => 2 , 
                             "Staff" => 3,
                       "Super Admin" => 4}, default: "Unapproved"
  
end
