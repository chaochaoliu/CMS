class Profile < ActiveRecord::Base
  extend Enumerize
  mount_uploader :image, ImageUploader
  # before_save :set_default_user
  validates_processing_of :image
  validate :image_size_validation
  has_paper_trail
  before_save :set_default_email


private
  def image_size_validation
    errors[:image] << "should be less than 3.5MB" if image.size > 3.5.megabytes
  end

   def set_default_email
    self.email ||= self.user.email
  end


  belongs_to :user

  enumerize :visa_type, in: {"F1" => 1, 
                          "F2" => 2 , 
                          "H1B" => 3,
                          "Others" => 4}, default: "F1"

  enumerize :gender, in: {"Male" => 1, 
                          "Female" => 2 , 
                          }, default: "Female"


  enumerize :marital_status, in: {"Married" => 1, 
                          "Single" => 2 , 
                          "Pregnant" => 3,
                          }, default: "Single"
  enumerize :is_house_leader, in: {"Yes" => 1, 
                          "No" => 2 , 
                          }, default: "No"
  enumerize :is_group_leader, in: {"Yes" => 1, 
                          "No" => 2 , 
                          }, default: "No"

  enumerize :is_pastor, in: {"Yes" => 1, 
                          "No" => 2 , 
                          }, default: "No"
  # def set_default_user
  #   user_id ||= current_user.id
  # end

end
