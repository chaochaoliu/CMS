class EventRegistration < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_paper_trail
  extend Enumerize

  validates :user_id, presence: true, numericality: true
  validates :event_id, presence: true, numericality: true
  validates :applicant_name, presence: true
  validates :application_reason, presence: true


  enumerize :approved, in: {"Unapproved" => 1, 
                          "Approved" => 2
                             }, default: "Unapproved"
end
