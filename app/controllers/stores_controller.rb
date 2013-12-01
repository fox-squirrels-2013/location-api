class StoresController < ApplicationController
  def index
    @current_position = [params[:latitude].to_f, params[:longitude].to_f]
    @surrounding_locations = Location.near(@current_position, 3)    

    render json: { surrounding_locations: @surrounding_locations }
  end
end  