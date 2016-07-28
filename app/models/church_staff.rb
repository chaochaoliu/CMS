class ChurchStaff < ActiveRecord::Base
  extend Enumerize
  has_paper_trail

  validates :position, presence: true, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true


  enumerize :position, in: {"主任牧师" => 1, 
                          "教会工作人员" => 2 , 
                       "网站开发者" => 3}, default: "主任牧师"


end
