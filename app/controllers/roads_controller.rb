class RoadsController < ApplicationController
  def index
    @roads = Road.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @roads }
    end
  end

  def new
    @road = Road.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @road }
    end
  end

  def show
    @road = Road.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @road }
    end
  end

  # POST /road
  # POST /road.json
  def create
    @road = Road.new(params[:road])
    xxRoad = Road.find_or_create_by(:name=>@road.name)
    @road.pois.each do |poi|
	xxRoad.pois.find_or_create_by(:ref => poi.ref, :ref_type => poi.ref_type)
    end
    respond_to do |format|
        format.html { redirect_to xxRoad, notice: 'road was successfully created.' }
        format.json { render json: xxRoad}
    end
    		
#    respond_to do |format|
#      if @road.save
#        format.html { redirect_to @road, notice: 'road was successfully created.' }
#        format.json { render json: {:result=>"succeeded!"}, status: :created, location: @road }
#      else
#        format.html { render action: "new" }
#        format.json { render json: @road.errors, status: :unprocessable_entity }
#      end
#    end
  end

end
