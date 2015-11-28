class ReleasesController < ApplicationController
  def index
  	@releases = Release.order('year asc')
  	@videos = Video.all
  end

  def show
  	@release = Release.find(params[:id])
  end
end
