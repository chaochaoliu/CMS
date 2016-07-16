class EventSermon < ActiveRecord::Base
  belongs_to :event
  has_many :event_sermon_reflections, dependent: :destroy
end
