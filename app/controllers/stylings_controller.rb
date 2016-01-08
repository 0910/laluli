class StylingsController < ApplicationController
  def index
  end
  def show
  	@styling = Styling.find(params[:id])
  end
  def lookbooks
  	@stylings = Styling.where('category_id = 1')
  end
  def performances
  	@stylings = Styling.where('category_id = 2')
  end
  def personal
  	@styling = Styling.find(params[:id])
  end
end
