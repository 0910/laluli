class CollectionsController < ApplicationController
  def index
  	@collections = Collection.all
  end

  def show
  	@collection = Collection.find(params[:id])
  	@previous = Collection.where("id < ?", params[:id]).order(:id).first   
    @next = Collection.where("id > ?", params[:id]).order(:id).first 
  end
end
