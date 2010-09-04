class TracksController < ApplicationController
  before_filter :new_track, :only => :create

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
