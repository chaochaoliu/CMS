class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  layout :resolve_layout


  # GET /events
  # GET /events.json
  def index
    @events = Event.order(:start_time).page params[:page]

  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event_registration = EventRegistration.find_by(:user_id => current_user.id, :event_id => params[:id])
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  def calendar
    @events = Event.all
  end

  def my_events
    @unsorted_my_approved_events = []
    @my_approved_event_registrations = EventRegistration.where(user_id: current_user.id, status: '2')
    @my_approved_event_registrations.each do |my_approved_event_registration|
      @unsorted_my_approved_events << my_approved_event_registration.event
    end
    @unsorted_my_approved_events.sort_by! { |thing| thing.start_time }
    @my_approved_events = Kaminari.paginate_array(@unsorted_my_approved_events).page(params[:page]).per(3) 
  end

  def event_detail
    @event = Event.find(params[:event_id])
    @event_sermons = @event.event_sermons
    @event_notices = @event.event_notices
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def resolve_layout
        case action_name
        when "my_events", "index"
          "events"
        else
          "application"
        end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :start_time, :end_time, :description,:ministry, :max_number_of_people, :target_people, :remaining_reservations, :deadline_of_appication)
    end
end
