import 'genre.dart';

class MovieDetails {
  final int id;
  final bool adult;
  final int budget;
  final List<Genre> genres;
  final String releaseDate;
  final int runtime;

  MovieDetails(
    this.id,
    this.adult,
    this.budget,
    this.genres,
    this.releaseDate,
    this.runtime,
  );

  MovieDetails.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        adult = json['adult'],
        budget = json['budget'],
        genres =( json['genres'] as List).map((genre) => new Genre.fromJson(genre)).toList(),
        releaseDate = json['release_date'],
        runtime = json['runtime'];
}
