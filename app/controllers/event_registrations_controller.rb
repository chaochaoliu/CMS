class EventRegistrationsController < ApplicationController
  before_action :set_event_registration, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @event_registrations = EventRegistration.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event_registration = EventRegistration.new
    @event = Event.find(params[:event_id])
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:event_id])
  end

  # POST /events
  # POST /events.json
  def create
    @event_registration = EventRegistration.new(event_registration_params)
    @event_registration.user = current_user
    @event_registration.event = Event.find(event_registration_params[:event_id])

    respond_to do |format|
      if @event_registration.save
        format.html { redirect_to @event_registration.event, notice: '已经成功提交申请，请等待管理员回复。' }
        format.json { render :show, status: :created, location: @registration }
      else
        format.html { render :new }
        format.json { render json: @event_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event_registration.update(event_registration_params)
        format.html { redirect_to @event_registration, notice: 'Registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event_registration.destroy
    respond_to do |format|
      format.html { redirect_to event_registrations_url, notice: 'Registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_registration
      @event_registration = EventRegistration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_registration_params
      params.require(:event_registration).permit(:user_id, :event_id,:application_reason, :applicant_name, :approved?)
    end
end
