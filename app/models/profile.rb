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
                          "其他" => 4}, default: "F1"

  enumerize :gender, in: {"男" => 1, 
                          "女" => 2 , 
                          }, default: "女"


  enumerize :marital_status, in: {"已婚" => 1, 
                          "单身" => 2 , 
                          }, default: "单身"

  enumerize :group_leader, in: {
                          "暂无" => 0,
                          "Elijah Jin" => 1, 
                          "Qijun Li" => 2 ,
                          "Irene Meng" => 3 ,
                          "Wentuo Liu" => 4 ,
                          "Jianbin Lei" => 5 ,
                          "Gongming Wei" => 6 ,
                          "Haiyan Luo" => 7 ,
                          "Yunchuan" => 8 ,
                          "Titos" => 9 ,
                          "Yanfei Li" => 10 ,
                          "Dazhi Zhang" => 11 ,
                          "Jiang Wang" => 12 , 
                          "Youhao Zhai" => 13 , 
                          "Xinxin Feng" => 14 , 
                          "Zhaomei Zong" => 15  
                          }, default: "暂无"

  enumerize :is_house_leader, in: {"是" => 1, 
                          "否" => 2 , 
                          }, default: "否"

  enumerize :is_group_leader, in: {"是" => 1, 
                          "否" => 2 , 
                          }, default: "否"

  enumerize :is_pastor, in: {"是" => 1, 
                          "否" => 2 , 
                          }, default: "否"
  # def set_default_user
  #   user_id ||= current_user.id
  # end

end
