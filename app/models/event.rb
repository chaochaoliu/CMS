class Event < ActiveRecord::Base
  has_many :event_registrations, dependent: :destroy
  has_many :users, through: :event_registrations
  has_many :event_notices, dependent: :destroy
  has_many :event_sermons, dependent: :destroy
  has_paper_trail
end
