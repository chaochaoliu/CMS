class Sermon < ActiveRecord::Base
  extend Enumerize
  mount_uploader :sermon_audio, SermonUploader
  has_many :sermon_reflections, dependent: :destroy
  has_many :sermon_sign_ins, dependent: :destroy
  has_paper_trail
  scope :sunday_service, -> { where category: 1}
  scope :morning_service, -> { where category: 2}
  scope :prayer_meeting, -> { where category: 3}
  scope :wednesday_evening_service, -> { where category: 4}


  enumerize :category, in: {"Sunday Service" => 1, 
                            "Morning Service" => 2 , 
                            "Prayer Meeting" => 3,
                       "Wednesday Evening Service" => 4}, default: "Morning Service"
end
