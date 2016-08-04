class SermonSignInsController < ApplicationController
  before_action :set_sermon_sign_in, only: [:show, :edit, :update, :destroy]

  # GET /sermon_sign_ins
  # GET /sermon_sign_ins.json
  def index
    @sermon_sign_ins = SermonSignIn.all
  end

  # GET /sermon_sign_ins/1
  # GET /sermon_sign_ins/1.json
  def show
  end

  # GET /sermon_sign_ins/new
  def new
    @sermon_sign_in = SermonSignIn.new
    @sermon = Sermon.find(params[:sermon_id])

  end

  # GET /sermon_sign_ins/1/edit
  def edit
  end

  # POST /sermon_sign_ins
  # POST /sermon_sign_ins.json
  def create
    @sermon_sign_in = SermonSignIn.new(sermon_sign_in_params)
    @sermon_sign_in.user = current_user
    @sermon_sign_in.sermon = Sermon.find(sermon_sign_in_params[:sermon_id])

    respond_to do |format|
      if @sermon_sign_in.save
        @sermon_sign_in.sermon.increment!(:sign_in_count)

        format.html { redirect_to @sermon_sign_in.sermon, notice: '您已经成功签到，写份感想吧。' }
        format.json { render :show, status: :created, location: @sermon_sign_in }
      else
        format.html { render :new }
        format.json { render json: @sermon_sign_in.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sermon_sign_ins/1
  # PATCH/PUT /sermon_sign_ins/1.json
  def update
    respond_to do |format|
      if @sermon_sign_in.update(sermon_sign_in_params)
        format.html { redirect_to @sermon_sign_in, notice: 'Sermon sign in was successfully updated.' }
        format.json { render :show, status: :ok, location: @sermon_sign_in }
      else
        format.html { render :edit }
        format.json { render json: @sermon_sign_in.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sermon_sign_ins/1
  # DELETE /sermon_sign_ins/1.json
  def destroy
    @sermon_sign_in.destroy
    respond_to do |format|
      format.html { redirect_to sermon_sign_ins_url, notice: 'Sermon sign in was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sermon_sign_in
      @sermon_sign_in = SermonSignIn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sermon_sign_in_params
      params.permit(:user_id, :sermon_id)
    end
end
