class InteriorsController < ApplicationController
  def index
  	@interiors = Interior.all
  end

  def show
  	@interior = Interior.find(params[:id])
  	@previous = Interior.where("id < ?", params[:id]).order(:id).first   
    @next = Interior.where("id > ?", params[:id]).order(:id).first 
  end
end
