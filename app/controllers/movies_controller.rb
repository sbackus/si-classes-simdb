class MoviesController < ApplicationController
  def index
    @movies = Movie.page params[:page]
  end

  def show
    @movie = Movie.find params[:id]

    respond_to do |format|
      format.html
      format.json { render json: @movie }
    end
  end

end
