class Character {
  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.episode,
  });

  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final List<String> episode;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        gender: json["gender"],
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "gender": gender,
        "image": image,
        "episode": List<dynamic>.from(episode.map((x) => x)),
      };
}
