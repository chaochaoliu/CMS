class EventSermon < ActiveRecord::Base
  belongs_to :event
  belongs_to :preacher
  has_paper_trail
  has_many :event_sermon_reflections, dependent: :destroy

  validates :title, presence: true
  validates :preacher, presence: true
  validates :event_id, presence: true, numericality: true



end
