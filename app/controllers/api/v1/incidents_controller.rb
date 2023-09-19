class Api::V1::IncidentsController < ApplicationController

  def index
    @incidents = Incident.all
    render json: @incidents
  end

  def show
    @incident = Incident.find(params[:id])
    render json: @incident
  end

  def create
    @incident = Incident.new(incident_params)
    if @incident.save
     render json: @incident
    else
     render error: { error: 'Unable to create Incident.' }, status: 400
    end 
  end

  def update
    puts "UPDATE INCIDENT #{params}"
    @incident = Incident.find_by(sys_id: params[:id])
    if @incident
      puts "Incident found. Updating with params: #{incident_params}"
      @incident.update(incident_params)
      render json: { message: 'Incident successfully updated. '}, status:200
    else
      render json: { error: 'Unable to update Incident. '}, status:400
    end 
  end

  private

  def incident_params
    params.permit(:sys_id, :number, :state)
  end
end
