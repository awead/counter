class PatronsController < ApplicationController

  helper_method :sort_column, :sort_direction

  # GET /patrons
  # GET /patrons.json
  def index
    @patrons = Patron.order(sort_column + " " + sort_direction)

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
    @patron = Patron.new(params[:patron])
    @patron.save
    if @patron.errors.any?
      message = @patron.errors[:barcode].first.to_s
    else
      message = "Barcode " + params[:patron][:barcode].to_s + " was checked in"
    end
    respond_to do |format|
      format.html { redirect_to checkin_path, :notice => message }
    end
  end

  private

  def sort_column
    Patron.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end
