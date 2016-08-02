class News < ActiveRecord::Base
  extend Enumerize
  validates :title, presence: true
  validates :content, presence: true
  validates :author, presence: true, length: { maximum: 100 }

  has_many :news_comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  has_paper_trail

  scope :grace_and_testimony, -> { where category: 1}
  scope :good_news, -> { where category: 2}

  scope :latest, ->{where status: 1}
  scope :recent, ->{where status: 2}


  enumerize :category, in: { 
                            "恩典见证" => 1,
                       "好消息" => 2,
                       }, default: "恩典见证"

  enumerize :status, in: { 
                       "最新" => 1,
                       "最近" => 2,
                       "过期" => 3}, default: "过期"

  enumerize :approved, in: {"是" => 1, 
                          "否" => 2 , 
                          }, default: "否"

end
