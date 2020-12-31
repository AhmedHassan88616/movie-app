class Cast {
  final int id;
  final String name;
  final String character;
  final String img;

  Cast(this.id, this.name, this.character, this.img);

  Cast.fromJson(Map<String, dynamic> json)
      : id = json['cast_id'],
        name = json['name'],
        character = json['character'],
        img = json['profile_path'];
}
