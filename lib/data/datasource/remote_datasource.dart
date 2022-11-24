import 'package:fashion_mobile_app/data/network/app_api.dart';
import 'package:fashion_mobile_app/data/network/network_info.dart';
import 'package:fashion_mobile_app/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<List<ItemResponse>> getItems ();
}

class RemoteDataSourceImpl implements RemoteDataSource {

  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);


  @override
  Future<List<ItemResponse>> getItems() async {
   return _appServiceClient.getItems();
  }

}