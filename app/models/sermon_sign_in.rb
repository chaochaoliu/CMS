class SermonSignIn < ActiveRecord::Base
  belongs_to :user
  belongs_to :sermon
  has_paper_trail

  validates :user_id, presence: true, numericality: true
  validates :sermon_id, presence: true, numericality: true

end
