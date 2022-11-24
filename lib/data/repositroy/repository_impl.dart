import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fashion_mobile_app/data/datasource/remote_datasource.dart';
import 'package:fashion_mobile_app/data/mapper/mapper.dart';
import 'package:fashion_mobile_app/data/network/error_handler.dart';
import 'package:fashion_mobile_app/data/network/failure.dart';
import 'package:fashion_mobile_app/data/network/network_info.dart';
import 'package:fashion_mobile_app/data/responses/responses.dart';
import 'package:fashion_mobile_app/domain/models/models.dart';
import 'package:fashion_mobile_app/domain/repository/repository.dart';

class RepositoryImpl implements Repository {

  final RemoteDataSource _remoteDataSource ;
  final NetworkInfo _networkInfo ;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);


  @override
  Future<Either<Failure, List<Item>>> getItems() async {
    if(await _networkInfo.isConnected){

      try{
        final response = await _remoteDataSource.getItems();
        return Right(List<Item>.from((response).map((e) => e.toDomain())));
      }catch (failure){
        ///failure is dioError
        ///unknown error you should handle it
        return Left(ErrorHandler.handle(failure).failure);
      }
    }else {
      return Left(DataSourceError.NO_INTERNET_CONNECTION.getFailure());
    }
  }

}