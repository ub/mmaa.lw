class MeetupEventsController < ApplicationController
  before_action :set_meetup_event, only: [:show, :edit, :update, :destroy]

  # GET /meetup_events
  # GET /meetup_events.json
  def index
    @meetup_events = MeetupEvent.all
  end

  # GET /meetup_events/1
  # GET /meetup_events/1.json
  def show
  end

  # GET /meetup_events/new
  def new
    @meetup_event = MeetupEvent.new
  end

  # GET /meetup_events/1/edit
  def edit
  end

  # POST /meetup_events
  # POST /meetup_events.json
  def create
    @meetup_event = MeetupEvent.new(meetup_event_params)

    respond_to do |format|
      if @meetup_event.save
        format.html { redirect_to @meetup_event, notice: 'Meetup event was successfully created.' }
        format.json { render :show, status: :created, location: @meetup_event }
      else
        format.html { render :new }
        format.json { render json: @meetup_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetup_events/1
  # PATCH/PUT /meetup_events/1.json
  def update
    respond_to do |format|
      if @meetup_event.update(meetup_event_params)
        format.html { redirect_to @meetup_event, notice: 'Meetup event was successfully updated.' }
        format.json { render :show, status: :ok, location: @meetup_event }
      else
        format.html { render :edit }
        format.json { render json: @meetup_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetup_events/1
  # DELETE /meetup_events/1.json
  def destroy
    @meetup_event.destroy
    respond_to do |format|
      format.html { redirect_to meetup_events_url, notice: 'Meetup event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meetup_event
      @meetup_event = MeetupEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meetup_event_params
      params.require(:meetup_event).permit(:description, :start_time, :place)
    end
end
