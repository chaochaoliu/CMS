require "rails_admin_send_bulk_email/engine"

module RailsAdminSendBulkEmail
end

require 'rails_admin/config/actions'

module RailsAdmin
  module Config
    module Actions
      class SendBulkEmail < Base
        RailsAdmin::Config::Actions.register(self)
        
        register_instance_option :object_level do
          true
        end
      end
    end
  end
end

