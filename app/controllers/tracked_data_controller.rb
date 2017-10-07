class TrackedDataController < ApplicationController
  before_action :set_tracked_datum, only: [:show, :edit, :update, :destroy, :hour]

  # GET /tracked_data
  # GET /tracked_data.json
  def index
    if params[:hour] != nil && params[:hour].to_i > 0
      @tracked_data = TrackedDatum.where(updated_at: params[:hour].to_i.hours.ago..Time.now).all.order(:pageURL)
    else
      @tracked_data = TrackedDatum.all.order(:pageURL)
    end
  end

  # GET /tracked_data/1
  # GET /tracked_data/1.json
  def show
  end

  # GET /tracked_data/new
  def new
    @tracked_datum = TrackedDatum.new
  end

  # GET /tracked_data/1/edit
  def edit
  end

  # POST /tracked_data
  # POST /tracked_data.json
  def create

    @tracked_datum = TrackedDatum.new(tracked_datum_params)

    respond_to do |format|
      if @tracked_datum.save
        format.html { redirect_to @tracked_datum, notice: 'Tracked datum was successfully created.' }
        format.json { render :show, status: :created, location: @tracked_datum }
      else
        format.html { render :new }
        format.json { render json: @tracked_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracked_data/1
  # PATCH/PUT /tracked_data/1.json
  def update
    respond_to do |format|
      if @tracked_datum.update(tracked_datum_params)
        format.html { redirect_to @tracked_datum, notice: 'Tracked datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @tracked_datum }
      else
        format.html { render :edit }
        format.json { render json: @tracked_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracked_data/1
  # DELETE /tracked_data/1.json
  def destroy
    @tracked_datum.destroy
    respond_to do |format|
      format.html { redirect_to tracked_data_url, notice: 'Tracked datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tracked_datum
      @tracked_datum = TrackedDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tracked_datum_params
      params.require(:tracked_datum).permit(:clientIP, :homepageURL, :pageURL, :hour)
    end
end
