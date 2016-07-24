class EventNotice < ActiveRecord::Base
  belongs_to :event
  has_paper_trail
  validates :title, presence: true
  validates :content, presence: true
  validates :publisher, presence: true
  validates :event_id, presence: true, numericality: true




end
