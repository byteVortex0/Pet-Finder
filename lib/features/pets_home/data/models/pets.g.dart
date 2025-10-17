// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pets _$PetsFromJson(Map<String, dynamic> json) => Pets(
  id: json['id'] as String,
  name: json['name'] as String,
  referenceImageId: json['reference_image_id'] as String,
  description: json['description'] as String,
  origin: json['origin'] as String,
  lifeSpan: json['life_span'] as String,
  weight: Weight.fromJson(json['weight'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PetsToJson(Pets instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'reference_image_id': instance.referenceImageId,
  'description': instance.description,
  'origin': instance.origin,
  'life_span': instance.lifeSpan,
  'weight': instance.weight,
};

Weight _$WeightFromJson(Map<String, dynamic> json) => Weight(
  imperial: json['imperial'] as String,
  metric: json['metric'] as String,
);

Map<String, dynamic> _$WeightToJson(Weight instance) => <String, dynamic>{
  'imperial': instance.imperial,
  'metric': instance.metric,
};
