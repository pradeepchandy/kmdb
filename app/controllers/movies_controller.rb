class MoviesController < ApplicationController
  def index
    @list_of_movies = Movie.all
    @list_of_directors = Director.all
  end

  def show
    # Your code goes here
    # Use the information after the slash in the URL to look up the movie with the corresponding ID number
    # Store the movie in the @movie instance variable so the view can format it

    movie_id = params[:id]
    @movie = Movie.find(movie_id)

  end
end
