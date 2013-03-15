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
end
