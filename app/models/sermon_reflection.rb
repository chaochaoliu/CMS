class SermonReflection < ActiveRecord::Base
  belongs_to :user
  belongs_to :sermon
  has_paper_trail
end
