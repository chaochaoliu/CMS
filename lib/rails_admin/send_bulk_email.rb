module RailsAdmin
  module Config
    module Actions
      class SendBulkEmail < RailsAdmin::Config::Actions::Base
        # # This ensures the action only shows up for Users
        # register_instance_option :visible? do
        #   authorized? && bindings[:object].class == Profile
        # end
        # We want the action on members, not the Users collection
        register_instance_option :collection do
          true
        end
        register_instance_option :http_methods do
          [:get, :post]
        end
        register_instance_option :link_icon do
          'icon-envelope'
        end
        # You may or may not want pjax for your action
        register_instance_option :pjax? do
          false
        end

        register_instance_option :controller do
          # byebug
          Proc.new do
            @objects = list_entries(@model_config)
            # # byebug
            # @objects.ids.each do |id|
            #   @profile = Profile.find(id)
            #   UserMailer.welcome_email(@profile).deliver_later
            # end
            # @message = Message.new

            # byebug
            # render @action.template_name
            # new_contact_path

          redirect_to main_app.new_message_path(:ids => @objects.ids)
          end
        end

        register_instance_option :bulkable? do
          true
        end

      end
    end
  end
end