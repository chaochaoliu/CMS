class NewscCommentsController < ApplicationController
  before_action :set_news_comment, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @news_comments = NewsComment.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @news_comment = NewsComment.new
    @news = News.find(params[:news_id])
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @news_comment = NewsComment.new(news_comment_params)
    @news_comment.user = current_user
    @news_comment.news = News.find(news_comment_params[:news_id])

    respond_to do |format|
      if @news_comment.save
        format.html { redirect_to @news_comment.news, notice: 'news_comment was successfully created.' }
        format.json { render :show, status: :created, location: @news_comment }
      else
        format.html { render :new }
        format.json { render json: @news_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @news_comment.update(news_comment_params)
        format.html { redirect_to @news_comment, notice: 'news_comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @news_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @news_comment.destroy
    respond_to do |format|
      format.html { redirect_to news_comments_url, notice: 'news_comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_comment
      @news_comment = NewsComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_comment_params
      params.require(:news_comment).permit(:user_id, :news_id,:content)
    end
end
