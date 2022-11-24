import 'package:fashion_mobile_app/app/constants.dart';
import 'package:fashion_mobile_app/app/extensions.dart';
import 'package:fashion_mobile_app/data/responses/responses.dart';
import 'package:fashion_mobile_app/domain/models/models.dart';

extension RatingResponseExtension on RatingResponse? {
  Rating toDomain(){

    return Rating(
        this?.rate.orZerodouble() ?? Constants.zeroDouble,
        this?.count.orZeo() ?? Constants.zero
    );
  }
}

extension ItemResponseExtension on ItemResponse {
  Item toDomain(){
    return Item(
        this?.id.orZeo() ?? Constants.zero ,
        this?.title.orEmpty() ?? Constants.empty,
        this?.price.orZerodouble() ?? Constants.zeroDouble,
        this?.description.orEmpty() ?? Constants.empty,
        this?.category.orEmpty() ?? Constants.empty,
        this?.image.orEmpty() ?? Constants.empty,
        this?.rating.toDomain() ?? Rating(Constants.zeroDouble, Constants.zero)
    );
  }
}