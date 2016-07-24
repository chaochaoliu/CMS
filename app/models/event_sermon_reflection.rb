class EventSermonReflection < ActiveRecord::Base
  extend Enumerize
  belongs_to :event_sermon
  belongs_to :user
  has_paper_trail

  validates :name, presence: true
  validates :content, presence: true
  validates :event_sermon_id, presence: true, numericality: true
  validates :user_id, presence: true, numericality: true

  enumerize :privacy_level, in: {"公开" => 1, 
                            "牧者可见" => 2 , 
                            "私有" => 3,
                               }, default: "公开"

end
