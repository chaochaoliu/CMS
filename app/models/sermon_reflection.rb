class SermonReflection < ActiveRecord::Base
  belongs_to :user
  belongs_to :sermon
end
