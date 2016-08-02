class EventRegistration < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_paper_trail
  extend Enumerize
  has_paper_trail

  validates :user_id, presence: true, numericality: true
  validates :event_id, presence: true, numericality: true
  validates :applicant_name, presence: true
  validates :application_reason, presence: true


  enumerize :approved, in: {"未批准" => 1, 
                          "批准" => 2
                             }, default: "未批准"
end
