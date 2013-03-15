class Movie < ActiveRecord::Base
  attr_accessible :title, :description, :released_on, :poster_url, :tagline, :tmdb_id, :imdb_id

  paginates_per 10
end
