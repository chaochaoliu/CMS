class EventSermonReflection < ActiveRecord::Base
  belongs_to :event_sermon
  belongs_to :user
end
