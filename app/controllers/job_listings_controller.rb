class JobListingsController < ApplicationController
  before_action :set_job_listing, only: [:show, :edit, :update, :destroy]

  # GET /job_listings
  # GET /job_listings.json
  def index
    @job_listings = JobListing.all
  end

  # GET /job_listings/1
  # GET /job_listings/1.json
  def show
  end

  # GET /job_listings/new
  def new
    @job_listing = JobListing.new
    @job_listing.applications.build
  end

  # GET /job_listings/1/edit
  def edit
  end

  # POST /job_listings
  # POST /job_listings.json
  def create
    @job_listing = JobListing.new(job_listing_params)

    if @job_listing.save
      redirect_to applications_path, notice: "Your job application for #{@job_listing.title} has been saved."
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /job_listings/1
  # PATCH/PUT /job_listings/1.json
  def update
    respond_to do |format|
      if @job_listing.update(job_listing_params)
        format.html { redirect_to @job_listing, notice: 'Job listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_listing }
      else
        format.html { render :edit }
        format.json { render json: @job_listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_listings/1
  # DELETE /job_listings/1.json
  def destroy
    @job_listing.destroy
    respond_to do |format|
      format.html { redirect_to job_listings_url, notice: 'Job listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_listing
      @job_listing = JobListing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_listing_params
      params.require(:job_listing).permit(:company_id, :title, :description, :location, :url, :date_posted, :contact, applications_attributes: [:id, :job_listing_id, :user_id, :resume, :cover_letter, :date_submitted, :status, :contact, :_destroy])
    end
end
