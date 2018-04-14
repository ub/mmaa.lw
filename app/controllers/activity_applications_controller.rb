class ActivityApplicationsController < ApplicationController
  before_action  :authenticate_user!, except: [:index, :show]

  before_action :set_meetup_event
  before_action :set_activity_application, only: [:show, :edit, :update, :destroy]

  # GET /activity_applications
  # GET /activity_applications.json
  def index
    @activity_applications = ActivityApplication.all
  end

  # GET /activity_applications/1
  # GET /activity_applications/1.json
  def show
  end

  # GET /activity_applications/new
  def new
    @activity_application = ActivityApplication.new
  end

  # GET /activity_applications/1/edit
  def edit
  end

  # POST /activity_applications
  # POST /activity_applications.json
  def create
    @activity_application = ActivityApplication.new(activity_application_params)

    respond_to do |format|
      if @activity_application.save
        format.html { redirect_to @activity_application, notice: 'Activity application was successfully created.' }
        format.json { render :show, status: :created, location: @activity_application }
      else
        format.html { render :new }
        format.json { render json: @activity_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_applications/1
  # PATCH/PUT /activity_applications/1.json
  def update
    respond_to do |format|
      if @activity_application.update(activity_application_params)
        format.html { redirect_to @activity_application, notice: 'Activity application was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_application }
      else
        format.html { render :edit }
        format.json { render json: @activity_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_applications/1
  # DELETE /activity_applications/1.json
  def destroy
    @activity_application.destroy
    respond_to do |format|
      format.html { redirect_to activity_applications_url, notice: 'Activity application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

  def set_meetup_event
    @meetup_event = MeetupEvent.find(params[:meetup_event_id])
  end


  def set_activity_application
      @activity_application = ActivityApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_application_params
      params.require(:activity_application).permit(:user_id, :name, :description, :duration, :tags)
    end
end
