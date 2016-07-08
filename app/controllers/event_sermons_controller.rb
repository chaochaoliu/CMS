class EventSermonsController < ApplicationController
  before_action :set_event_sermon, only: [:show, :edit, :update, :destroy]

  # GET /event_sermons
  # GET /event_sermons.json
  def index
    @event_sermons = EventSermon.all
  end

  # GET /event_sermons/1
  # GET /event_sermons/1.json
  def show
  end

  # GET /event_sermons/new
  def new
    @event = Event.find(params[:event_id])
    @event_sermon = EventSermon.new
  end

  # GET /event_sermons/1/edit
  def edit
      @event = Event.find(params[:event_id])

  end

  # POST /event_sermons
  # POST /event_sermons.json
  def create
    @event_sermon = EventSermon.new(event_sermon_params)
    @event = Event.find(event_sermon_params[:event_id])
    @event_sermon.event = @event

    respond_to do |format|
      if @event_sermon.save
        format.html { redirect_to event_detail_path(:event_id => @event_sermon.event.id), notice: 'Event sermon was successfully created.' }
        format.json { render :show, status: :created, location: @event_sermon }
      else
        format.html { render :new }
        format.json { render json: @event_sermon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_sermons/1
  # PATCH/PUT /event_sermons/1.json
  def update
    respond_to do |format|
      if @event_sermon.update(event_sermon_params)
        format.html { redirect_to @event_sermon, notice: 'Event sermon was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_sermon }
      else
        format.html { render :edit }
        format.json { render json: @event_sermon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_sermons/1
  # DELETE /event_sermons/1.json
  def destroy
    @event_sermon.destroy
    respond_to do |format|
      format.html { redirect_to event_sermons_url, notice: 'Event sermon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_sermon
      @event_sermon = EventSermon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_sermon_params
      params.require(:event_sermon).permit(:event_id, :title, :preacher, :sermon_date, :content, :sermon_audio, :sermon_video)
    end
end
