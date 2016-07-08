class EventRegistration < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_paper_trail
  extend Enumerize


  enumerize :approved, in: {"Unapproved" => 1, 
                          "Approved" => 2
                             }, default: "Unapproved"
end
