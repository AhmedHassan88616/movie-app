import 'package:movies_app/models/video.dart';

class VideoResponse {
  List<Video> videos;
  String error;

  VideoResponse(this.videos, this.error);

  VideoResponse.fromJson(Map<String, dynamic> json)
      : videos =
            (json['results'] as List).map((e) => Video.fromJson(e)).toList(),
        error = "";

  VideoResponse.withError(String errorValue)
      : videos = List(),
        error = errorValue;
}
