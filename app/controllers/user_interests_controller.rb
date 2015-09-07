class UserInterestsController < ApplicationController
  before_action :set_user_interest, only: [:show, :edit, :update, :destroy]

  # GET /user_interests
  # GET /user_interests.json
  def index
    # Get a list of the current user's company interests
    @current_user_interests = current_user.user_interests.by_company.paginate(:page => params[:page]).per_page(10)
  end

  # GET /user_interests/1
  # GET /user_interests/1.json
  def show
  end

  # GET /user_interests/new
  def new
    @user_interest = UserInterest.new
  end

  # GET /user_interests/1/edit
  def edit
  end

  # POST /user_interests
  # POST /user_interests.json
  def create
    @user_interest = UserInterest.new(user_interest_params)

    if @user_interest.save
      redirect_to user_interest_path, notice: "Your interest for ${@user_interest.company.name} has been saved."
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /user_interests/1
  # PATCH/PUT /user_interests/1.json
  def update
    respond_to do |format|
      if @user_interest.update(user_interest_params)
        format.html { redirect_to @user_interest, notice: 'User interest was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_interest }
      else
        format.html { render :edit }
        format.json { render json: @user_interest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_interests/1
  # DELETE /user_interests/1.json
  def destroy
    @user_interest.destroy
    respond_to do |format|
      format.html { redirect_to user_interests_url, notice: 'User interest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_interest
      @user_interest = UserInterest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_interest_params
      params.require(:user_interest).permit(:company_id, :user_id, :rating)
    end
end
