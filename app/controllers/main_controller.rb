class MainController < ApplicationController
  def index
    # @latest_notifications = Notification.find(:all, :order => "id desc", :limit => 2).reverse
    @latest_notifications = Notification.last(2)
    @latest_events = Event.last(2)
    @latest_scripture = DailyScripture.last
    
    @my_approved_events = []
    @event_sermons = []
    @my_approved_event_registrations = EventRegistration.where(user_id: current_user.id, status: '2')
    
    unless @my_approved_event_registrations.nil?
      @my_approved_event_registrations.each do |my_approved_event_registration|
        @my_approved_events << my_approved_event_registration.event
      end
    end

    unless @my_approved_events.nil?
      @my_approved_events.each do |approved_event|
          approved_event.event_sermons.each do |event_sermon|
             @event_sermons << event_sermon
         end
      end
    end

    @sermons = Sermon.all
    @events = @event_sermons + @sermons
    
  end  
end