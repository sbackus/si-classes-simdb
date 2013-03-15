class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.date :released_on
      t.string :poster_url
      t.string :tagline
      t.string :tmdb_id
      t.string :imdb_id
      t.timestamps
    end
  end
end
