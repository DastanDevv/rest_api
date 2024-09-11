import 'package:rest_full_api/model/breed_model.dart';

class CatImage {
  final String id;
  final String url;
  final List<Breed> breeds;

  CatImage({
    required this.id,
    required this.url,
    required this.breeds,
  });

  factory CatImage.fromJson(Map<String, dynamic> json) {
    var breedsFromJson = json['breeds'] as List;
    List<Breed> breedList =
        breedsFromJson.map((i) => Breed.fromJson(i)).toList();

    return CatImage(
      id: json['id'],
      url: json['url'],
      breeds: breedList,
    );
  }
}
