import 'package:movies_app/models/cast_response.dart';
import 'package:movies_app/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class CastsBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject _subject = BehaviorSubject<CastResponse>();

  getCasts(int id) async {
    CastResponse response = await _repository.getCasts(id);
    _subject.sink.add(response);
  }

  BehaviorSubject<CastResponse> get subject => _subject;

  void drainStream() {
    _subject.value = null;
  }

  dispose() async {
    await _subject.drain();
    _subject.close();
  }
}

final castsBloc = CastsBloc();
