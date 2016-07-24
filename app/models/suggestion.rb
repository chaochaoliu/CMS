class Suggestion < ActiveRecord::Base
  extend Enumerize
  has_paper_trail
  before_save :set_default_name

  validates :title, presence: true
  validates :content, presence: true
  validates :send_to, presence: true

  enumerize :send_to, in: {"教会牧者" => 1, 
                          "教会工作人员" => 2 , 
                           }, default: "教会牧者"
  def set_default_name
    self.name ||= current_user.profile.full_name
  end
  
end
