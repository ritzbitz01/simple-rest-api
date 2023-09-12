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
    @incident = Incident.find(params[:id])
    if @incident
     @incident.update(incident_params)
     render json: { message: 'Incident successfully update. '}, status:200
    else
     render json: { error: 'Unable to update Incident. '}, status:400
    end 
  end

  private
  
  def incident_params
    params.require(:incident).permit(:sys_id, :number)
  end
  # route_param :id do
  #   #
  #   # /incidents/:id
  #   #
  #   params do
  #     requires :id, type: Integer, desc: 'Endpoint ID', documentation: { example: '42' }
  #   end
  #   get do
  #     @incident = Incident.find(params[:id])
  #     render json: @incident
  #   end

  #   def update
  #     @user = User.find(params[:id])
  #     if @user
  #      @user.update(user_params)
  #      render json: { message: 'User successfully update. '}, status:200
  #     else
  #      render json: { error: 'Unable to update user. '}, status:400
  #     end 
  #    end
  # end
end
