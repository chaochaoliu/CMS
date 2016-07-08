class Message < ActiveRecord::Base
    mount_uploader :attachment, AttachmentUploader
    has_paper_trail

end
