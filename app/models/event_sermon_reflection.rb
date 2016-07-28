class EventSermonReflection < ActiveRecord::Base
  extend Enumerize
  belongs_to :event_sermon
  belongs_to :user
  has_paper_trail

  validates :name, presence: true
  validates :content, presence: true
  validates :event_sermon_id, presence: true, numericality: true
  validates :user_id, presence: true, numericality: true

  enumerize :privacy_level, in: {
                            "收藏，同时发送给讲道人" => 1 , 
                            "仅收藏" => 2,
                               }, default: "收藏，同时发送给讲道人"

end
