class HomeController < ApplicationController

  def index
    @tracks = Track.all
    
    respond_to do |format|
      format.html
    end
  end
end
