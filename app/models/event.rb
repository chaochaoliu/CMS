class Event < ActiveRecord::Base
  extend Enumerize
  validates :name, presence: true
  validates :description, presence: true
  validates :ministry, presence: true
  validates :max_number_of_people, presence: true
  validates :deadline_of_appication, presence: true
  validate :deadline_of_appication_cannot_be_in_the_past
  validates :name, numericality: true

  has_many :event_registrations, dependent: :destroy
  has_many :users, through: :event_registrations
  has_many :event_notices, dependent: :destroy
  has_many :event_sermons, dependent: :destroy
  has_paper_trail

  paginates_per 3

  enumerize :status, in: { 
                       "最新" => 1,
                       "最近" => 2,
                       "过期" => 3}, default: "过期"


  def deadline_of_appication_cannot_be_in_the_past
    if deadline_of_appication.present? && deadline_of_appication < Date.today
      errors.add(:deadline_of_appication, "can't be in the past")
    end
  end 
end
