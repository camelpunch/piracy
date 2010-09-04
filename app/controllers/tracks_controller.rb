class TracksController < ApplicationController
  before_filter :new_track, :only => :create

  def index
    if params[:lat] && params[:lng]
      @tracks = Track.all(:origin => [params[:lat], params[:lng]],
                          :within => 0.2)
    else
      @tracks = Track.all
    end

    respond_to do |format|
      format.html
      format.json do
        render :json => {:tracks => @tracks}
      end
    end
  end

  def create
    if @track.save
      head :created, :location => @track.url
    end
  end

  protected

  def new_track
    params.delete(:action)
    params.delete(:controller)
    @track = Track.new params
  end
end
