class StylingsController < ApplicationController
  def index
  end
  def show
  	@styling = Styling.find(params[:id])
  end
  def lookbooks
    @lookbook = true
  	@stylings = Styling.where('category_id = 1')
  end
  def performances
    @performances = true
  	@stylings = Styling.where('category_id = 2')
  end
  def personal
    @personal = true
  	@styling = Styling.find(params[:id])
  end
end
