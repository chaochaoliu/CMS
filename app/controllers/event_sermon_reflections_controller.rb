class EventSermonReflectionsController < ApplicationController
  before_action :set_event_sermon_reflection, only: [:show, :edit, :update, :destroy]

  # GET /event_sermon_reflections
  # GET /event_sermon_reflections.json
  def index
    @event_sermon_reflections = EventSermonReflection.all
  end

  # GET /event_sermon_reflections/1
  # GET /event_sermon_reflections/1.json
  def show
  end

  # GET /event_sermon_reflections/new
  def new
    @event_sermon = EventSermon.find(params[:event_sermon_id])
    @event_sermon_reflection = EventSermonReflection.new
  end

  # GET /event_sermon_reflections/1/edit
  def edit
  end

  # POST /event_sermon_reflections
  # POST /event_sermon_reflections.json
  def create
    @event_sermon_reflection = EventSermonReflection.new(event_sermon_reflection_params)
    @event_sermon_reflection.user = current_user
    @event_sermon = EventSermon.find(event_sermon_reflection_params[:event_sermon_id])
    @event_sermon_reflection.event_sermon = @event_sermon

    respond_to do |format|
      if @event_sermon_reflection.save
        format.html { redirect_to @event_sermon_reflection.event_sermon, notice: 'Event sermon reflection was successfully created.' }
        format.json { render :show, status: :created, location: @event_sermon_reflection }
      else
        format.html { render :new }
        format.json { render json: @event_sermon_reflection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_sermon_reflections/1
  # PATCH/PUT /event_sermon_reflections/1.json
  def update
    respond_to do |format|
      if @event_sermon_reflection.update(event_sermon_reflection_params)
        format.html { redirect_to @event_sermon_reflection, notice: 'Event sermon reflection was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_sermon_reflection }
      else
        format.html { render :edit }
        format.json { render json: @event_sermon_reflection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_sermon_reflections/1
  # DELETE /event_sermon_reflections/1.json
  def destroy
    @event_sermon_reflection.destroy
    respond_to do |format|
      format.html { redirect_to event_sermon_reflections_url, notice: 'Event sermon reflection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_sermon_reflection
      @event_sermon_reflection = EventSermonReflection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_sermon_reflection_params
      params.require(:event_sermon_reflection).permit(:name, :content, :event_sermon_id)
    end
end
