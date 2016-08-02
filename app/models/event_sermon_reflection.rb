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
                            "仅收藏" => 1 , 
                            "收藏，同时发送给讲道人" => 2,
                               }, default: "仅收藏"

end
