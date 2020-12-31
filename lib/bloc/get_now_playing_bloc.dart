import 'package:movies_app/models/movie_response.dart';
import 'package:movies_app/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class NowPlayingListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject _subject = BehaviorSubject<MovieResponse>();

  getMovies() async {
    MovieResponse response = await _repository.getMovies();
    _subject.sink.add(response);
  }

  BehaviorSubject<MovieResponse> get subject => _subject;

  dispose() {
    _subject.close();
  }
}
final  nowPlayingMoviesBloc=NowPlayingListBloc();