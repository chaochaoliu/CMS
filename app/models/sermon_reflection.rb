class SermonReflection < ActiveRecord::Base
  extend Enumerize
  belongs_to :user
  belongs_to :sermon
  has_paper_trail

  validates :content, presence: true
  validates :user_id, presence: true, numericality: true
  validates :sermon_id, presence: true, numericality: true
  validates :privacy_level, presence: true, numericality: true


  enumerize :privacy_level, in: {
                            "收藏，同时发送给讲道人" => 1 , 
                            "仅收藏" => 2,
                               }, default: "收藏，同时发送给讲道人"

end
