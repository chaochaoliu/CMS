class EventNotice < ActiveRecord::Base
  belongs_to :event
  validates :title, presence: true
  validates :content, presence: true
  validates :publisher, presence: true
  validates :event_id, presence: true, numericality: true




end
