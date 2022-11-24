import 'package:dartz/dartz.dart';
import 'package:fashion_mobile_app/data/network/failure.dart';
import 'package:fashion_mobile_app/domain/models/models.dart';
import 'package:fashion_mobile_app/domain/repository/repository.dart';
import 'package:fashion_mobile_app/domain/usecases/base_usecase.dart';

class getItemsUseCase implements BaseUseCase<void,List<Item>>{

  final Repository _repository;

  getItemsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Item>>> execute(void input) async{
    return _repository.getItems();
  }

}