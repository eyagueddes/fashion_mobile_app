import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class RatingResponse {
  @JsonKey(name:"rate")
  double? rate;
  @JsonKey(name:"count")
  int? count;
  RatingResponse(this.rate,this.count);


  factory RatingResponse.fromJson(Map<String, dynamic> json) => _$RatingResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RatingResponseToJson(this);
}


@JsonSerializable()
class ItemResponse {

  @JsonKey(name:"id")
  int? id;
  @JsonKey(name:"title")
  String? title ;
  @JsonKey(name:"price")
  double? price ;
  @JsonKey(name:"description")
  String? description;
  @JsonKey(name:"category")
  String? category;
  @JsonKey(name:"image")
  String? image;
  @JsonKey(name:"rating")
  RatingResponse? rating;

  ItemResponse(
      this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating
      );

  factory ItemResponse.fromJson(Map<String, dynamic> json) => _$ItemResponseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ItemResponseToJson(this);
}