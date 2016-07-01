class Message < ActiveRecord::Base
    mount_uploader :attachment, AttachmentUploader

end
