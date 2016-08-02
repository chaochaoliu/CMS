class MainController < ApplicationController
  def index
    # @latest_notifications = Notification.find(:all, :order => "id desc", :limit => 2).reverse
    @latest_notifications = Notification.last(2)
    @latest_events = Event.last(2)
    @latest_scripture = DailyScripture.last
    
    @event_sermons = []
    @my_approved_events = current_user.events.where("approved = ?", '2')
    @my_approved_events.each do |approved_event|
        approved_event.event_sermons.each do |event_sermon|
           @event_sermons << event_sermon
       end
    end
    @sermons = Sermon.all
    @events = @event_sermons + @sermons
  end
  
end