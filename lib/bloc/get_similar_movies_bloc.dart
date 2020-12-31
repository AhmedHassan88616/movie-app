


import 'package:movies_app/models/movie_detail_response.dart';
import 'package:movies_app/models/movie_response.dart';
import 'package:movies_app/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class SimilarMoviesBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject _subject = BehaviorSubject<MovieResponse>();

  getSimilarMovies(int id) async {
    MovieResponse response = await _repository.getSimilarMovies(id);
    _subject.sink.add(response);
  }

  BehaviorSubject<MovieResponse> get subject => _subject;

  void drainStream() {
    _subject.value = null;
  }

  dispose() async {
    await _subject.drain();
    _subject.close();
  }
}

final similarMoviesBloc = SimilarMoviesBloc();
