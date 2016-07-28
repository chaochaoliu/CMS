class Preacher < ActiveRecord::Base
  extend Enumerize
  has_many :sermons
  has_many :event_sermons
  has_paper_trail

  validates :name, presence: true
  validates :email, presence: true

  enumerize :name, in: {"雅各牧师" => 1, 
                          "以利亚牧师" => 2 , 
                             "素燕牧师" => 3,
                       "其他" => 4}, default: "雅各牧师"
  
end
