


import 'package:movies_app/models/video_response.dart';
import 'package:movies_app/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieVideosBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject _subject = BehaviorSubject<VideoResponse>();

  getMovieVideos(int id) async {
    VideoResponse response = await _repository.getVideos(id);
    _subject.sink.add(response);
  }

  BehaviorSubject<VideoResponse> get subject => _subject;

  void drainStream() {
    _subject.value = null;
  }

  dispose() async {
    await _subject.drain();
    _subject.close();
  }
}

final movieVideosBloc = MovieVideosBloc();
