class TripsController < ApplicationController
  # GET /trips
  # GET /trips.json

  before_filter :authenticate_admin!

  def index
    @trips = Trip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips }
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = Trip.find(params[:id])

    render :partial => 'trips/show'
    #page.replace_html 'dialog-message' ,:partial => 'trips/show'
    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.js
    #  on { render :partial => 'trips/show' }
    #
    #end
  end

  # GET /trips/new
  # GET /trips/new.json
  def new
    @trip = Trip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(params[:trip])

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render json: @trip, status: :created, location: @trip }
      else
        format.html { render action: "new" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trips/1
  # PUT /trips/1.json
  def update
    @trip = Trip.find(params[:id])

    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end
  end

  def reimburse

    @trip = Trip.find_by_pid(params[:id])

    if params[:f_amt] == "" or params[:r_amt] == "" then
      render :json => {:id => params[:id], :status => 'false', :message => 'Please enter both - Forward amount and Reverse amount'}
    else
      if !(params[:f_amt].to_i.to_s ==  params[:f_amt]) or !(params[:r_amt].to_i.to_s ==  params[:r_amt]) then
        render :json => {:id => params[:id], :status => 'false', :message => 'Please enter an integer amount'}

      elsif      @trip.f_remb_amt.nil? and @trip.r_remb_amt.nil? then

      @trip.f_remb_amt = params[:f_amt]
      @trip.r_remb_amt = params[:r_amt]
      @trip.save
      render :json => {:id => params[:id], :status => 'true', :message => 'Reimbursed', :f_amt => params[:f_amt], :r_amt => params[:r_amt]}
      else
        render :json => {:id => params[:id], :status => 'reimbursed', :message => 'Already Reimbursed', :f_amt => @trip.f_remb_amt, :r_amt => @trip.r_remb_amt}
      end


    end

  end
end
