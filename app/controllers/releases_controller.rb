class ReleasesController < ApplicationController
  def index
  	@releases = Release.all.reverse_order
  end

  def show
  	@release = Release.find(params[:id])
  end
end
