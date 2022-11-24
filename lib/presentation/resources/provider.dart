import 'dart:ffi';

import 'package:fashion_mobile_app/app/di.dart';
import 'package:fashion_mobile_app/domain/models/models.dart';
import 'package:fashion_mobile_app/domain/usecases/getItems_usecase.dart';
import 'package:riverpod/riverpod.dart';

final itemDataProvider = FutureProvider.autoDispose((_){
  final getItemsUseCase _getItem = instance<getItemsUseCase>();
  return _getItem.execute(Void);

});