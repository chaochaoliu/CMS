class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  layout :resolve_layout

  # GET /news
  # GET /news.json
  def index
    @news = News.all
  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    @news = News.new(news_params)
    respond_to do |format|
      if @news.save
        format.html { redirect_to thank_you_for_submitting_news_path }
        format.json { render :show, status: :created, location: @news }
      else
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to news_index_path, notice: 'News was successfully updated.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_url, notice: 'News was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def thank_you_for_submitting_news
  end

  def service_review
    @latest_sunday_service = Sermon.sunday_service.latest.last
    @recent_sunday_services = Sermon.sunday_service.recent.last(3)
  end

  def recent_sunday_service
    @recent_sunday_service = Sermon.find(params[:service_id])
  end

  def testimony
    @latest_testimonys = News.grace_and_testimony.latest
  end

  def recent_testimony
    @recent_testimonys = News.grace_and_testimony.recent
  end

  def good_news
    @latest_good_news = News.good_news.latest
  end

    def recent_good_news
    @recent_good_news = News.good_news.recent
  end

  private
  def resolve_layout
        case action_name
        when "good_news", "testimony","service_review"
          "news"
        else
          "application"
        end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:title, :author, :date, :content, :image, :category)
    end
end
