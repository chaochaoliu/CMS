class ReflectionsController < ApplicationController
  before_action :set_reflection, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @reflections = Reflection.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @reflection = Reflection.new
    @event = Event.find(params[:event_id])
  end

  # GET /events/1/edit
  def edit
    @event = @reflection.event

  end

  # POST /events
  # POST /events.json
  def create
    @reflection = Reflection.new(reflection_params)
    @reflection.user = current_user
    @reflection.event = Event.find(reflection_params[:event_id])

    respond_to do |format|
      if @reflection.save
        format.html { redirect_to @reflection, notice: 'reflection was successfully created.' }
        format.json { render :show, status: :created, location: @reflection }
      else
        format.html { render :new }
        format.json { render json: @reflection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @reflection.update(reflection_params)
        format.html { redirect_to @reflection, notice: 'reflection was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @reflection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @reflection.destroy
    respond_to do |format|
      format.html { redirect_to reflections_url, notice: 'reflection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reflection
      @reflection = Reflection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reflection_params
      params.require(:reflection).permit(:user_id, :event_id, :content)
    end
end

