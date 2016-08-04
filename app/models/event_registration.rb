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


  enumerize :status, in: {"审查中" => 1, 
                          "批准" => 2,
                           "拒绝" => 3 }, default: "审查中"
end
