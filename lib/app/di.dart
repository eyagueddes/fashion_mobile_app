import 'package:dio/dio.dart';
import 'package:fashion_mobile_app/data/datasource/remote_datasource.dart';
import 'package:fashion_mobile_app/data/network/app_api.dart';
import 'package:fashion_mobile_app/data/network/dio_factory.dart';
import 'package:fashion_mobile_app/data/network/network_info.dart';
import 'package:fashion_mobile_app/data/repositroy/repository_impl.dart';
import 'package:fashion_mobile_app/domain/repository/repository.dart';
import 'package:fashion_mobile_app/domain/usecases/getItems_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

GetIt instance = GetIt.instance;

Future<void> initAppModule() async {

  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));
  
  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(instance()));

  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance(), instance()));

}

initHomeModule(){
  if(!GetIt.I.isRegistered<getItemsUseCase>()){
    instance.registerFactory<getItemsUseCase>(() => getItemsUseCase(instance()));
 /// to DO : maybe add riverpod
  }
}