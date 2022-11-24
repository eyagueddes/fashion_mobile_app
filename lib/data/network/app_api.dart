import 'package:fashion_mobile_app/app/constants.dart';
import 'package:fashion_mobile_app/data/responses/responses.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET("/products?fbclid=IwAR2yLhmTope8nYxciVO-UbIseDMTjZMoL_4kXLUUcpQfu3GJLv3NWNvfGBs")
  Future<List<ItemResponse>> getItems();
}