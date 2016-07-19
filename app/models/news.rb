class News < ActiveRecord::Base
  extend Enumerize
  validates :title, presence: true
  validates :content, presence: true
  validates :author, presence: true, length: { maxmum: 100 }


  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
  has_paper_trail

  scope :church, -> { where category: 1}
  scope :elim, -> { where category: 2}
  scope :missions, -> { where category: 3}
  scope :grace_and_testimony, -> { where category: 4}
  scope :others, -> { where category: 5}



  enumerize :category, in: {"教会新闻" => 1, 
                            "以琳新闻" => 2 , 
                            "传教会新闻" => 3,
                       "恩典见证" => 4,
                       "其他" => 5}, default: "教会新闻"

end
