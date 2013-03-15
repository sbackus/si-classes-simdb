require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "index displays a list of movies when there are movies" do
    (1..20).each { |i| Movie.create( :title => "Movie ##{i}", :released_on => Date.today, :tagline => "In a world.... where...." ) }
    
    get :index
    assert_response :success

    movies = assigns(:movies)
    assert_not_nil movies

    assert_equal 10, movies.count
    assert_equal 20, movies.total_count
  end

  test "index displays nothing when there are no movies" do
    get :index
    assert_response :success

    movies = assigns(:movies)
    assert_not_nil movies

    assert_equal 0, movies.count
  end

  test "update with valid movie" do
    new_title = "James Bond: From GitHub with Love"
    movie = Movie.create( :title => "James Bond: Octocat", :released_on => 2.days.ago, :tagline => "DRY with a vengeance!" )

    post :update, id: movie.id, movie: { :title => new_title }

    assert_redirected_to movie_path(movie)
    
    movie.reload
    assert_equal new_title, movie.title
    assert_equal "Updated #{new_title}", flash[:success]
  end
end
