class Event < ActiveRecord::Base
  has_many :registrations
  has_many :users, through: :registrations
  has_many :reflections
end
