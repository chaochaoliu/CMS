class EventSermon < ActiveRecord::Base
  belongs_to :event
  has_many :event_sermon_reflections
end
