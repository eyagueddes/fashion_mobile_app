import 'package:dio/dio.dart';
import 'package:fashion_mobile_app/data/network/failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error){
    if(error is DioError){
      failure = _handleError(error);
    }else{
      failure = DataSourceError.DEFAULT.getFailure();
    }
  }
}

Failure _handleError (DioError error){
  switch (error.type){

    case DioErrorType.connectTimeout:
      return DataSourceError.CONNECT_TIMEOUT.getFailure();
    case DioErrorType.sendTimeout:
      return DataSourceError.SEND_TIMEOUT.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSourceError.RECEIVE_TIMEOUT.getFailure();
    case DioErrorType.response:
      if(error.response != null && error.response?.statusCode != null && error.response?.statusMessage != null){
        return Failure(error.response?.statusCode ?? 0,error.response?.statusMessage ?? '');
      }else {
        return DataSourceError.DEFAULT.getFailure();
      }

    case DioErrorType.cancel:
      return DataSourceError.CANCEL.getFailure();

    case DioErrorType.other:
      return DataSourceError.DEFAULT.getFailure();

  }
}


enum DataSourceError {
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  DEFAULT,
  NO_INTERNET_CONNECTION
}


class ResponseCode {
  static const int DEFAULT = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int NO_INTERNET_CONNECTION = -6;
}


class ResponseMessage {
  static const String DEFAULT = "some thing went wrong, try again later";
  static const String CONNECT_TIMEOUT = "time out error, try again later";
  static const String CANCEL = "request was cancelled, try again later";
  static const String RECEIVE_TIMEOUT = "time out error, try again later";
  static const String SEND_TIMEOUT = "time out error, try again later";
  static const String NO_INTERNET_CONNECTION =
      "Please check your internet connection";
}

extension DataSourceErrorExtension on DataSourceError {
  Failure getFailure(){
    switch(this){

      case DataSourceError.CONNECT_TIMEOUT:
        return Failure(ResponseCode.CONNECT_TIMEOUT,ResponseMessage.CONNECT_TIMEOUT);
      case DataSourceError.CANCEL:
        return Failure(ResponseCode.CANCEL,ResponseMessage.CANCEL);
      case DataSourceError.RECEIVE_TIMEOUT:
        return Failure(ResponseCode.RECEIVE_TIMEOUT,ResponseMessage.RECEIVE_TIMEOUT);
      case DataSourceError.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT,ResponseMessage.SEND_TIMEOUT);
      case DataSourceError.DEFAULT:
        return Failure(ResponseCode.DEFAULT,ResponseMessage.DEFAULT);
      case DataSourceError.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,ResponseMessage.NO_INTERNET_CONNECTION);
    }
  }
}