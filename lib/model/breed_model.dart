class Breed {
  final String name;
  final String description;
  final String origin;

  Breed({
    required this.name,
    required this.description,
    required this.origin,
  });

  factory Breed.fromJson(Map<String, dynamic> json) {
    return Breed(
      name: json['name'],
      description: json['description'],
      origin: json['origin'],
    );
  }
}
