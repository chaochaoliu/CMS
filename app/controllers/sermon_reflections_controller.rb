class SermonReflectionsController < ApplicationController
  before_action :set_sermon_reflection, only: [:show, :edit, :update, :destroy]

  # GET /sermon_reflections
  # GET /sermon_reflections.json
  def index
    @sermon_reflections = SermonReflection.all
    # @event_sermon_reflections = EventSermonReflection.all
  end

  def my_reflections
    @my_sermon_reflections = current_user.sermon_reflections
    @my_event_sermon_reflections = current_user.event_sermon_reflections
  end

  # GET /sermon_reflections/1
  # GET /sermon_reflections/1.json
  def show
  end

  # GET /sermon_reflections/new
  def new
    @sermon_reflection = SermonReflection.new
    @sermon = Sermon.find(params[:sermon_id])

  end

  # GET /sermon_reflections/1/edit
  def edit
    @sermon = Sermon.find(params[:sermon_id])

  end

  def my_sermon_reflections
    @my_sermon_reflections = current_user.sermon_reflections
  end

  # POST /sermon_reflections
  # POST /sermon_reflections.json
  def create
    @sermon_reflection = SermonReflection.new(sermon_reflection_params)
    @sermon_reflection.user = current_user
    @sermon_reflection.sermon = Sermon.find(sermon_reflection_params[:sermon_id])
    respond_to do |format|
      if @sermon_reflection.save
        if @sermon_reflection.privacy_level == 2
          @preacher = @sermon_reflection.sermon.preacher
          UserMailer.email_sermon_reflection_to_preacher(@preacher, @sermon_reflection).deliver_later
        end
        format.html { redirect_to @sermon_reflection.sermon, notice: 'Sermon reflection was successfully created.' }
        format.json { render :show, status: :created, location: @sermon_reflection }
      else
        format.html { render :new }
        format.json { render json: @sermon_reflection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sermon_reflections/1
  # PATCH/PUT /sermon_reflections/1.json
  def update
    @sermon = 
    respond_to do |format|
      if @sermon_reflection.update(sermon_reflection_params)

        if @sermon_reflection.privacy_level == 2
          @preacher = @sermon_reflection.sermon.preacher
          UserMailer.email_sermon_reflection_to_preacher(@preacher, @sermon_reflection).deliver_later
        end

        format.html { redirect_to @sermon_reflection.sermon, notice: 'Sermon reflection was successfully updated.' }
        format.json { render :show, status: :ok, location: @sermon_reflection }
      else
        format.html { render :edit }
        format.json { render json: @sermon_reflection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sermon_reflections/1
  # DELETE /sermon_reflections/1.json
  def destroy
    @sermon_reflection.destroy
    respond_to do |format|
      format.html { redirect_to sermon_reflections_url, notice: 'Sermon reflection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sermon_reflection
      @sermon_reflection = SermonReflection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sermon_reflection_params
      params.require(:sermon_reflection).permit(:content,:sermon_id,:title,:name, :privacy_level)
    end
end
