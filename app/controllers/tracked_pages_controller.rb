class TrackedPagesController < ApplicationController
  before_action :set_tracked_page, only: [:show, :edit, :update, :destroy]

  # GET /tracked_pages
  # GET /tracked_pages.json
  def index
    if params[:hour] != nil && params[:hour].to_i > 0
      @tracked_pages = TrackedPage.where(updated_at: params[:hour].to_i.hours.ago..Time.now).all.order(:pageURL)
    else
      @tracked_pages = TrackedPage.all.order(:pageURL)
    end
  end

  # GET /tracked_pages/1
  # GET /tracked_pages/1.json
  def show
  end

  # GET /tracked_pages/new
  def new
    @tracked_page = TrackedPage.new
  end

  # GET /tracked_pages/1/edit
  def edit
  end

  # POST /tracked_pages
  # POST /tracked_pages.json
  def create
    @tracked_page = TrackedPage.new(tracked_page_params)

    respond_to do |format|
      if @tracked_page.save
        format.html { redirect_to @tracked_page, notice: 'Tracked page was successfully created.' }
        format.json { render :show, status: :created, location: @tracked_page }
      else
        format.html { render :new }
        format.json { render json: @tracked_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracked_pages/1
  # PATCH/PUT /tracked_pages/1.json
  def update
    respond_to do |format|
      if @tracked_page.update(tracked_page_params)
        format.html { redirect_to @tracked_page, notice: 'Tracked page was successfully updated.' }
        format.json { render :show, status: :ok, location: @tracked_page }
      else
        format.html { render :edit }
        format.json { render json: @tracked_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracked_pages/1
  # DELETE /tracked_pages/1.json
  def destroy
    @tracked_page.destroy
    respond_to do |format|
      format.html { redirect_to tracked_pages_url, notice: 'Tracked page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tracked_page
      @tracked_page = TrackedPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tracked_page_params
      params.require(:tracked_page).permit(:homepageURL, :pageURL, :pageViews)
    end
end
