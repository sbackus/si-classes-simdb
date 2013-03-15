require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test "index displays a list of movies when there are movies" do
    (1..20).each { |i| create_movie("Title ##{i}") }
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
    movie = create_movie("James Bond: Octocat")

    post :update, id: movie.id, movie: { :title => new_title }

    assert_redirected_to movie_path(movie)
    
    movie.reload
    assert_equal new_title, movie.title
    assert_equal "Updated #{new_title}", flash[:success]
  end

  test "update with invalid movie" do
    new_title = ""
    movie = create_movie("James Bond: Octocat")

    post :update, id: movie.id, movie: { :title => new_title }

    assigned_movie = assigns(:movie)

    assert_template :edit
    assert_not_nil assigned_movie.errors
    assert_equal 1, assigned_movie.errors.count
    assert_equal ["can't be blank"], assigned_movie.errors[:title]
  end

private

  def create_movie(title)
    Movie.create( :title => title, 
                  :released_on => Date.today, 
                  :description => 'Man, you should really look into something better... Perhaps FactoryGirl?', 
                  :tagline => "In a world.... where...." )

  end

end
