import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio(BaseOptions(
    baseUrl:
        'https://5ff7d6d510778b00170428a8.mockapi.io/api/v1/', // กำหนด Base URL
    connectTimeout: const Duration(seconds: 5), // ตั้งเวลา timeout
    receiveTimeout: const Duration(seconds: 5),
  ));

  Dio get dio => _dio;
}
