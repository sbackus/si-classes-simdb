class MoviesController < InheritedResources::Base
  respond_to :html, :xml, :json

  def update
    @movie = Movie.find params[:id]
    if @movie.update_attributes(params[:movie])
      redirect_to movie_path(@movie), flash: { success: "Updated #{@movie.title}" }
    else
      flash.now[:error] = "WTF Man!"
      render 'edit'
    end
  end

protected

  def collection
    @movies ||= end_of_association_chain.page(params[:page])
  end
end
