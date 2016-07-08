class MyEventsController < ApplicationController
  def index
    @my_events = current_user.events
  end
end
