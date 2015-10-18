class HomeController < ApplicationController
  def index
  	@collections = Collection.all.limit(1).reverse_order
  	@interiors = Interior.all.limit(1).reverse_order
  	@stylings = Styling.all.limit(1).reverse_order
  	@releases = Release.all.limit(1).reverse_order
  end
end
