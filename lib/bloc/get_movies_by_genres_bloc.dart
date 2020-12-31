import 'package:movies_app/models/movie_response.dart';
import 'package:movies_app/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesListByGenresBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject _subject = BehaviorSubject<MovieResponse>();

  getMoviesByGenres(int id ) async {
    MovieResponse response = await _repository.getMoviesWithGenres(id);
    _subject.sink.add(response);
  }

  BehaviorSubject<MovieResponse> get subject => _subject;
  void drainStream() {
    _subject.value = null;
  }
  dispose() {
    _subject.close();
  }
}
final  moviesByGenresBloc=MoviesListByGenresBloc();