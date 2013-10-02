class ParticipantsController < ApplicationController
  # GET /participants
  # GET /participants.json

  before_filter :authenticate_admin!

  def index
    @participants = Participant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @participants }
    end
  end

  # GET /participants/1
  # GET /participants/1.json
  def show
    @participant = Participant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @participant }
    end
  end

  # GET /participants/new
  # GET /participants/new.json
  def new
    @participant = Participant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @participant }
    end
  end

  # GET /participants/1/edit
  def edit
    @participant = Participant.find(params[:id])
  end

  # POST /participants
  # POST /participants.json
  def create
    @participant = Participant.new(params[:participant])

    respond_to do |format|
      if @participant.save
        format.html { redirect_to @participant, notice: 'Participant was successfully created.' }
        format.json { render json: @participant, status: :created, location: @participant }
      else
        format.html { render action: "new" }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /participants/1
  # PUT /participants/1.json
  def update
    @participant = Participant.find(params[:id])

    respond_to do |format|
      if @participant.update_attributes(params[:participant])
        format.html { redirect_to @participant, notice: 'Participant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy

    respond_to do |format|
      format.html { redirect_to participants_url }
      format.json { head :no_content }
    end
  end


  def enter
    @participant = Participant.find_by_pid(params[:part_id])
    @eligibility = @participant.trip.f_remb_eligible == 'Eligible' || @participant.trip.r_remb_eligible == 'Eligible'

    if   @participant.entry? then
      render :json => {:id => params[:part_id], :status => 'false', :message => 'Already Registered', :color => 'red'}
    else
      @participant.update_attribute(:entry, true)
      render :json => {:id => params[:part_id], :status => 'true', :message => 'Accepted', :color => 'green', :eligibility => "#{@eligibility}"}

    end

  end

  def frisking
    @participants = Participant.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @participants }
    end

  end

  def frisk
    @participant = Participant.find_by_pid(params[:part_id])

    if   @participant.frisk? then
      render :json => {:id => params[:part_id], :status => 'false', :message => 'Already Cleared', :color => 'red'}
    else
      @participant.update_attribute(:frisk, true)
      render :json => {:id => params[:part_id], :status => 'true', :message => 'Cleared', :color => 'green'}
    end

  end

end