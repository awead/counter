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
      logger.info("Valid? ==> #{@patron.valid?}")
      @patron.save
    else
      @patron = Patron.find(p.id)
      logger.info("Valid? ==> #{@patron.valid?}")
      @patron.increment
    end

    if @patron.errors.any?
      message = @patron.errors[:barcode].first.to_s
    else
      message = "Barcode " + params[:patron][:barcode].to_s + " was checked in"
    end

    respond_to do |format|
      format.html { redirect_to checkin_path, :notice => message }
    end
  end

end
