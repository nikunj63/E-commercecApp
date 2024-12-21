import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String BASE_URL = "http://192.168.31.181:5001/api";
const Map<String, dynamic> DFAULT_HEADER= {
  'Content-Type' : 'application/json',
};

class Api {
  final Dio  _dio = Dio();

  Api(){
    _dio.options.baseUrl = BASE_URL;
    _dio.options.headers = DFAULT_HEADER ; 
    _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }
  Dio get sendRequest => _dio;
}

class ApiResponse {
  bool sucess;
  dynamic data;
  String? message;

  ApiResponse({
    required this.sucess,
    this.data,
    this.message,
  });
  factory ApiResponse.fromResponse(Response response){
    final data = response.data as Map<String , dynamic>;
    return ApiResponse(
      sucess: data["sucess"],
      data:data["data"],
      message: data["message"] ?? "Unexpected error",
    );
  }
}