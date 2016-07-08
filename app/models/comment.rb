class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :news
  has_paper_trail
end
