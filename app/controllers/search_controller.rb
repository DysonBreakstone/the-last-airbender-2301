class SearchController < ApplicationController
  def index
    @facade = SearchFacade.new(params[:nation])
  end
end