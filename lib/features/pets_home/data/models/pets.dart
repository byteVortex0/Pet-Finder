import 'package:json_annotation/json_annotation.dart';

part 'pets.g.dart';

@JsonSerializable()
class Pets {
  final String id;
  final String name;
  @JsonKey(name: 'reference_image_id')
  final String referenceImageId;
  final String description;
  final String origin;
  @JsonKey(name: 'life_span')
  final String lifeSpan;
  final Weight weight;

  Pets({
    required this.id,
    required this.name,
    required this.referenceImageId,
    required this.description,
    required this.origin,
    required this.lifeSpan,
    required this.weight,
  });

  factory Pets.fromJson(Map<String, dynamic> json) => _$PetsFromJson(json);
  Map<String, dynamic> toJson() => _$PetsToJson(this);

  String get imageUrl =>
      'https://cdn2.thecatapi.com/images/$referenceImageId.jpg';
}

@JsonSerializable()
class Weight {
  final String imperial;
  final String metric;

  const Weight({required this.imperial, required this.metric});

  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);
}
