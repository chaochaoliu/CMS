class SermonsController < ApplicationController
  before_action :set_sermon, only: [:show, :edit, :update, :destroy]
  layout :resolve_layout

  # GET /sermons
  # GET /sermons.json
  def index
    @sermons = Sermon.all
  end

  # GET /sermons/1
  # GET /sermons/1.json
  def show
    @my_sermon_reflection = SermonReflection.find_by(:user_id => current_user.id,
      :sermon_id => @sermon.id)

    @sermon_sign_in = SermonSignIn.find_by(:user_id => current_user.id, :sermon_id => @sermon.id)
  end

  # GET /sermons/new
  def new
    @sermon = Sermon.new
  end

  # GET /sermons/1/edit
  def edit
  end

  def sunday_service
    @sunday_services = Sermon.sunday_service.order(:start_time).page params[:page]
  end

  def morning_service
    @morning_services = Sermon.morning_service.order(:start_time).page params[:page]
  end

  def wednesday_service
    @wednesday_services = Sermon.wednesday_evening_service.order(:start_time).page params[:page]
  end

  def prayer_meeting
    @prayer_meetings = Sermon.prayer_meeting.order(:start_time).page params[:page]
  end

  def other_service
    @other_services = Sermon.other_service.order(:start_time).page params[:page]
  end

  # POST /sermons
  # POST /sermons.json
  def create
    @sermon = Sermon.new(sermon_params)

    respond_to do |format|
      if @sermon.save
        format.html { redirect_to @sermon, notice: 'Sermon was successfully created.' }
        format.json { render :show, status: :created, location: @sermon }
      else
        format.html { render :new }
        format.json { render json: @sermon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sermons/1
  # PATCH/PUT /sermons/1.json
  def update
    respond_to do |format|
      if @sermon.update(sermon_params)
        format.html { redirect_to @sermon, notice: 'Sermon was successfully updated.' }
        format.json { render :show, status: :ok, location: @sermon }
      else
        format.html { render :edit }
        format.json { render json: @sermon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sermons/1
  # DELETE /sermons/1.json
  def destroy
    @sermon.destroy
    respond_to do |format|
      format.html { redirect_to sermons_url, notice: 'Sermon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def resolve_layout
        case action_name
        when "sunday_service", "morning_service","wednesday_service","prayer_meeting"
          "sermons"
        else
          "application"
        end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_sermon
      @sermon = Sermon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sermon_params
      params.require(:sermon).permit(:title, :start_time, :preacher, :content, :category, :scripture,:sermon_audio,:sermon_video,:status,:sign_in_count)
    end
end
