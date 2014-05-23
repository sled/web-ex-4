class FlickrController < ApplicationController
  before_filter :authorize
  layout false

  def show
  end

  def search
    @results = flickr.photos.search(text: flickr_params[:q] , per_page: 12)
  end

  protected

  def flickr_params
    params.require(:flickr).permit(:q)
  end
end
