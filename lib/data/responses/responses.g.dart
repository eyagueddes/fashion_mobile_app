// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingResponse _$RatingResponseFromJson(Map<String, dynamic> json) =>
    RatingResponse(
      (json['rate'] as num?)?.toDouble(),
      json['count'] as int?,
    );

Map<String, dynamic> _$RatingResponseToJson(RatingResponse instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'count': instance.count,
    };

ItemResponse _$ItemResponseFromJson(Map<String, dynamic> json) => ItemResponse(
      json['id'] as int?,
      json['title'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['description'] as String?,
      json['category'] as String?,
      json['image'] as String?,
      json['rating'] == null
          ? null
          : RatingResponse.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemResponseToJson(ItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'rating': instance.rating,
    };
