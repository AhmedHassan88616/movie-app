import 'package:movies_app/models/genre_response.dart';
import 'package:movies_app/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class GenresListBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject _subject = BehaviorSubject<GenreResponse>();

  getGenres() async {
    GenreResponse response = await _repository.getGenres();
    _subject.sink.add(response);
  }

  BehaviorSubject<GenreResponse> get subject => _subject;

  dispose() {
    _subject.close();
  }
}
final  genresBloc=GenresListBloc();