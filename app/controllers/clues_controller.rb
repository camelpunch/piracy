class CluesController < ApplicationController
  def index
    @tracks = Track.all :order => 'id DESC'

    respond_to do |format|
      format.atom
    end
  end
end
