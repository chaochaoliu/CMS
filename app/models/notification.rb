class Notification < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  validates :publisher, presence: true
  validate :image_size_validation
  # validates :publish_date, presence: true
  has_paper_trail
  mount_uploader :image, ImageUploader

  validates_processing_of :image
 
private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end
  
end
