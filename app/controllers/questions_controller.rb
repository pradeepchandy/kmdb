class QuestionsController < ApplicationController
  def question_1
    # How many movies are in the database?

    # Your Ruby goes here.

    @number_of_movies = Movie.count
  end

  def question_2
    # In what year was the oldest movie on the list released?

     @year_of_oldest_movie = Movie.minimum("year")

  end

  def question_3
    # How many movies does the director of the first movie have on the list?

    # Your Ruby goes here.

     @number_of_movies_directed_by_first_movie_director = Movie.where({:director_id => Movie.first.director_id }).count
  end

  def question_4
    # What is the most number of movies any single director has on the list?

    # Your Ruby goes here.
    # You'll probably have to use both ActiveRecord query methods as well as some plain old Ruby logic.
  #  director_movie_count = Movie.select( "director_id as dirid , count( title) as movies_count").group("director_id")

  # @most_number_of_movies_by_a_single_director =  director_movie_count.maximum("movies_count")

max_movies=0
list_of_directors = Director.all

list_of_directors.each do |director|

temp = Movie.where({:director_id => director.id }).count
if   temp>= max_movies
  max_movies = temp
end
end
@most_number_of_movies_by_a_single_director  = max_movies
end


  def question_5
    # What is the most recent movie on the list that the first actor appeared in?

    # Your Ruby goes here.
    # You'll probably have to use both ActiveRecord query methods as well as some plain old Ruby logic.
 # first find the actor

 list_of_movies_by_first_actor = Role.where({:actor_id => Actor.first.id })

max_year =0
max_title = "test"
list_of_movies_by_first_actor.each do |movie|

temp_year = Movie.find(movie.movie_id).year.to_i

if   temp_year>= max_year
  max_year = temp_year
  max_title= Movie.find(movie.movie_id).title
end
end

@most_recent_movie_for_first_actor  = max_title

end
end
