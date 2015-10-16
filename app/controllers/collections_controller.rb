class CollectionsController < ApplicationController
  def index
  	@collections = Collection.all.reverse_order
  end

  def show
  	@collection = Collection.find(params[:id])
  end
end
