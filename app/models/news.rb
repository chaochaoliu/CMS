class News < ActiveRecord::Base
  extend Enumerize
  validates :title, presence: true
  validates :content, presence: true
  validates :author, presence: true, length: { maximum: 100 }


  has_many :news_comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  has_paper_trail

  scope :service_review, -> { where category: 1}
  scope :healing_heart, -> { where category: 2}
  scope :grace_and_testimony, -> { where category: 3}
  scope :good_news, -> { where category: 4}
  scope :others, -> { where category: 5}



  enumerize :category, in: {"礼拜回顾" => 1, 
                            "心灵医治" => 2 , 
                            "恩典见证" => 3,
                       "好消息" => 4,
                       "其他" => 5}, default: "礼拜回顾"

end
