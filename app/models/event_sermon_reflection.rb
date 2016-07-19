class EventSermonReflection < ActiveRecord::Base
  belongs_to :event_sermon
  belongs_to :user

  validates :name, presence: true
  validates :content, presence: true
  validates :event_sermon_id, presence: true, numericality: true
  validates :user_id, presence: true, numericality: true

end
