class InteriorsController < ApplicationController
  def index
  	@interiors = Interior.all.reverse_order
  end

  def show
  	@interior = Interior.find(params[:id])
  end
end
