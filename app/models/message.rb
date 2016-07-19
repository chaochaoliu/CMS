class Message < ActiveRecord::Base
    mount_uploader :attachment, AttachmentUploader
    has_paper_trail

    validates :content, presence: true
    validates :to, presence: true
    validates :subject, presence: true




end
