import 'package:movies_app/models/movie_details.dart';

class MovieDetailResponse {
  final MovieDetails movieDetails;
  final String error;

  MovieDetailResponse(this.movieDetails, this.error);

  MovieDetailResponse.fromJson(Map<String, dynamic> json)
      : movieDetails = MovieDetails.fromJson(json),
        error = "";

  MovieDetailResponse.withError(String errorValue)
      : movieDetails = MovieDetails(null, null, null, null, "", null),
        error = errorValue;
}
