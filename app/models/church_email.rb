class ChurchEmail < ActiveRecord::Base
  extend Enumerize
  has_paper_trail

  validates :position, presence: true, uniqueness: true
  validates :email, presence: true

  enumerize :position, in: {"教会牧者" => 1, 
                          "教会工作人员" => 2 , 
                       "网站开发者" => 3}, default: "教会牧者"
  
end
