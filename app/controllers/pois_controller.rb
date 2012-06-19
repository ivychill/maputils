class PoisController < ApplicationController
  def create
    @road = Road.find(params[:road_id])
    puts params[:ref]
    @poi = @road.pois.find_or_create_by(:ref => params[:ref]).update_attributes(:X => params[:X], :Y => params[:Y])
    redirect_to @road, :notice => "poi created!"
  end
end
