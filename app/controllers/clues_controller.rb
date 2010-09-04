class CluesController < ApplicationController
  def index
    @tracks = Track.all

    respond_to do |format|
      format.atom
    end
  end
end
