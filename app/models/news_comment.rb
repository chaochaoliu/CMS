class NewsComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :news
  has_paper_trail

  validates :content, presence: true
  validates :user_id, presence: true, numericality: true
  validates :news_id, presence: true, numericality: true

end
