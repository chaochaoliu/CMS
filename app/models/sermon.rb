class Sermon < ActiveRecord::Base
  extend Enumerize
  mount_uploader :sermon_audio, SermonUploader
  has_many :sermon_reflections, dependent: :destroy
  has_many :sermon_sign_ins, dependent: :destroy
  belongs_to :preacher
  has_paper_trail
  validates :title, presence: true
  validates :preacher, presence: true
  validates :category, presence: true, numericality: true
  before_save :set_default_sign_in_count

  scope :sunday_service, -> { where category: 1}
  scope :morning_service, -> { where category: 2}
  scope :prayer_meeting, -> { where category: 3}
  scope :wednesday_evening_service, -> { where category: 4}
  scope :other_service, -> { where category: 5}

  scope :latest, ->{where status: 1}
  scope :recent, ->{where status: 2}

  enumerize :category, in: {"主日礼拜" => 1, 
                            "早礼拜" => 2 , 
                            "祷告会" => 3,
                       "周三晚礼拜" => 4,
                       " 其他" => 5}, default: "早礼拜"

  enumerize :status, in: { 
                       "最新" => 1,
                       "最近" => 2,
                       "过期" => 3}, default: "过期"

  paginates_per 3

 def set_default_sign_in_count
    self.sign_in_count  ||= 0          #will set the default value only if it's nil
  end

end
