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

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    if @movie.update_attributes(params[:movie])
      redirect_to movie_path(@movie), flash: { success: "Updated #{@movie.title}" }
    else
      flash.now[:error] = "WTF Man!"
      render 'edit'
    end
  end

end
