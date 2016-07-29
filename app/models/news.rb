class News < ActiveRecord::Base
  extend Enumerize
  validates :title, presence: true
  validates :content, presence: true
  validates :author, presence: true, length: { maximum: 100 }

  has_many :news_comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  has_paper_trail

  scope :service_review, -> { where category: 1}
  scope :grace_and_testimony, -> { where category: 3}
  scope :good_news, -> { where category: 4}
  scope :others, -> { where category: 5}



  enumerize :category, in: {"礼拜回顾" => 1, 
                            "恩典见证" => 2,
                       "好消息" => 3,
                       "其他" => 4}, default: "恩典见证"

end
