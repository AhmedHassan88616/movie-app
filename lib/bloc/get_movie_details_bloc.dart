import 'package:movies_app/models/movie_detail_response.dart';
import 'package:movies_app/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieDetailsBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject _subject = BehaviorSubject<MovieDetailResponse>();

  getMovieDetails(int id) async {
    MovieDetailResponse response = await _repository.getMovieDetails(id);
    _subject.sink.add(response);
  }

  BehaviorSubject<MovieDetailResponse> get subject => _subject;

  void drainStream() {
    _subject.value = null;
  }

  dispose() async {
    await _subject.drain();
    _subject.close();
  }
}

final movieDetailsBloc = MovieDetailsBloc();
