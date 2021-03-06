import 'package:dio/dio.dart';
import 'package:movies_app/models/cast_response.dart';
import 'package:movies_app/models/genre_response.dart';
import 'package:movies_app/models/movie_detail_response.dart';
import 'package:movies_app/models/movie_response.dart';
import 'package:movies_app/models/person_response.dart';
import 'package:movies_app/models/video_response.dart';

class MovieRepository {
  final String apiKey = "260087916beac142d3b41d28786d6c58";
  static String mainUrl = 'https://api.themoviedb.org/3';
  final Dio _dio = Dio();

  var getPopularUrl = '$mainUrl/movie/top_rated';
  var getMovieUrl = '$mainUrl/discover/movie';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getGenresUrl = '$mainUrl/genre/movie/list';
  var getPersonUrl = '$mainUrl/trending/person/week';
  var movieUrl = '$mainUrl/movie';

  Future<MovieResponse> getMovies() async {
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
      'page': 1,
    };

    try {
      Response response =
          await _dio.get(getPopularUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print('Exception occurred: $error stackTrace:$stackTrace');
      return MovieResponse.withError(error);
    }
  }

  Future<MovieResponse> getPlayingMovies() async {
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
      'page': 1,
    };

    try {
      Response response =
          await _dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print('Exception occurred: $error stackTrace:$stackTrace');
      return MovieResponse.withError(error);
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
       'page': 1,
    };

    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print('Exception occurred: $error stackTrace:$stackTrace');
      return GenreResponse.withError(error);
    }
  }

  Future<PersonResponse> getPersons() async {
    var params = {
      'api_key': apiKey,
    };

    try {
      Response response = await _dio.get(getPersonUrl, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print('Exception occurred: $error stackTrace:$stackTrace');
      return PersonResponse.withError(error);
    }
  }

  Future<MovieResponse> getMoviesWithGenres(int id) async {
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
      'page': 1,
      'with_genres': id,
    };

    try {
      Response response = await _dio.get(getMovieUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print('Exception occurred: $error stackTrace:$stackTrace');
      return MovieResponse.withError(error);
    }
  }

  Future<MovieDetailResponse>getMovieDetails(int id)async{
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
    };

    try {
      Response response = await _dio.get(movieUrl+'/$id', queryParameters: params);
      return MovieDetailResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print('Exception occurred: $error stackTrace:$stackTrace');
      return MovieDetailResponse.withError(error);
    }
  }

  Future<CastResponse>getCasts(int id)async{
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
    };

    try {
      Response response = await _dio.get(movieUrl+'/$id'+'/casts', queryParameters: params);
      return CastResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print('Exception occurred: $error stackTrace:$stackTrace');
      return CastResponse.withError(error);
    }
  }


  Future<MovieResponse>getSimilarMovies(int id)async{
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
    };

    try {
      Response response = await _dio.get(movieUrl+'/$id'+'/similar', queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print('Exception occurred: $error stackTrace:$stackTrace');
      return MovieResponse.withError(error);
    }
  }

  Future<VideoResponse>getVideos(int id)async{
    var params = {
      'api_key': apiKey,
      'language': 'en-US',
    };

    try {
      Response response = await _dio.get(movieUrl+'/$id'+'/videos', queryParameters: params);
      return VideoResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      print('Exception occurred: $error stackTrace:$stackTrace');
      return VideoResponse.withError(error);
    }
  }
}
