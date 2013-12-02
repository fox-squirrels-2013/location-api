class StoresController < ApplicationController
  def index
    current_position = [params[:latitude].to_f, params[:longitude].to_f]

    results = Store.find_results current_position

    render json: {results: [results]}
  end
end 
