class PatronsController < ApplicationController
  # GET /patrons
  # GET /patrons.json
  def index
    @patrons = Patron.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @patrons }
    end
  end

  # GET /checkin
  def checkin
    @patron = Patron.new
  end

  # POST /patrons
  def create
    p = Patron.find_by_barcode(params[:patron][:barcode])
    if p.nil?
      @patron = Patron.new(params[:patron])
      @patron.save
    else
      @patron = Patron.find(p.id)
      @patron.increment
    end

    message = "Barcode " + params[:patron][:barcode].to_s + " was checked in"

    respond_to do |format|
      format.html { redirect_to checkin_path, :notice => message }
    end
  end

end
