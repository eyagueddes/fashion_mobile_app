import 'package:dartz/dartz.dart';
import 'package:fashion_mobile_app/data/network/failure.dart';
import 'package:fashion_mobile_app/domain/models/models.dart';

abstract class Repository {
  Future<Either<Failure,List<Item>>> getItems();
}