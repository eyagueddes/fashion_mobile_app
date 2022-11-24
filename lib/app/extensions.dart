import 'package:fashion_mobile_app/app/constants.dart';

extension NonNullString on String? {
  String orEmpty(){
    if (this == null){
      return Constants.empty;
    }else{
      return this!;
    }
  }
}


extension NonNullInteger on int? {
  int orZeo(){
    if(this == null){
      return Constants.zero;
    }else{
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double orZerodouble(){
    if (this == null){
      return Constants.zeroDouble;
    }else {
      return this!;
    }
  }
}