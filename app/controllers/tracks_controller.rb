class TracksController < ApplicationController
  before_filter :new_track, :only => :create

  def index
    tracks = Track.all(:origin => [params[:lat], params[:lng]],
                       :within => 0.2)
    respond_to do |format|
      format.json do
        render :json => tracks
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
