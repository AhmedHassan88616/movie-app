import 'cast.dart';

class CastResponse {
  List<Cast> casts;
  String error;

  CastResponse(this.casts, this.error);

  CastResponse.fromJson(Map<String, dynamic> json)
      : casts = (json['cast'] as List).map((e) => Cast.fromJson(e)).toList(),
        error = "";

  CastResponse.withError(String errorValue):casts=List(),error=errorValue;
}
