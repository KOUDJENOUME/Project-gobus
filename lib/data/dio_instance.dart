import 'package:dio/dio.dart';

Dio configureDio() {
  Dio dio = Dio();
  dio.options.baseUrl = 'http://10.0.2.2:3030/';  // Remplacez par l'URL de votre API
  dio.options.connectTimeout = Duration(milliseconds: 60000);  // Timeout de connexion
  dio.options.receiveTimeout = Duration(milliseconds: 60000);  // Timeout de réception
  return dio;
}
