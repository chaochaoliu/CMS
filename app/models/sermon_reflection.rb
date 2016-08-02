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
                            "否" => 1 , 
                            "是" => 2,
                               }, default: "否"

end
