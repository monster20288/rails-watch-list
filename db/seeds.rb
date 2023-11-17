require "json"
require "open-uri"
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end





# https://api.themoviedb.org/3/movie/top_rated?api_key=18b529a1e606fa6f7227f3a78c6e0918
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)


url = "https://api.themoviedb.org/3/movie/top_rated?api_key=18b529a1e606fa6f7227f3a78c6e0918"
user_serialized = URI.open(url).read
movieslist = JSON.parse(user_serialized)
# puts "#{movieslist["results"]}"

movieslist["results"].each do |movie|
#  puts "Movie_list start"
#   puts "Id:  #{movie["id"]}"
#   puts "origin[l_title: #{movie["title"]}"
#   puts "overview:[#{movie["overview"]}"
#   puts "poster_pat[: https://image.tmdb.org/t/p/original/#{movie["poster_path"]}"
#   puts "vote_average: #{movie["vote_average"]}"

  Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/original/#{movie["poster_path"]}",
    rating: movie["vote_average"]
  )
# puts "Movie_list end"

end

List.create(name:"Classic Movies")
List.create(name:"Superhero")
# puts "Movie_list end"
