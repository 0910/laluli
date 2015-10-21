class StylingsController < ApplicationController
  def index
  	@stylings = Styling.all.reverse_order
  end
  def show
  	@styling = Styling.find(params[:id])
    @previous = Styling.where("id < ?", params[:id]).order(:id).first   
    @next = Styling.where("id > ?", params[:id]).order(:id).first
  end
  def lookbooks
    @lookbook = true
  	@stylings = Styling.where('category_id = 1')
  	render :index
  end
  def performances
    @performances = true
  	@stylings = Styling.where('category_id = 2')
  	render :index
  end
  def personal
    @personal = true
  	@stylings = Styling.where('category_id = 3')
  	render :index
  end
end
