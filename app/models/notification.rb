class Notification < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  validates :publisher, presence: true
  # validates :publish_date, presence: true
  has_paper_trail
  mount_uploader :image, ImageUploader
end
