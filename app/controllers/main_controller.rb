class MainController < ApplicationController
  def index
    # @latest_notifications = Notification.find(:all, :order => "id desc", :limit => 2).reverse
    @latest_notifications = Notification.last(2)
    @latest_news = News.last(2)
    @latest_sermons = Sermon.last(2)
    @latest_events = Event.last(2)
    @latest_scripture = DailyScripture.last


  end
  
end