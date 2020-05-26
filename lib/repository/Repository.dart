import 'package:dio/dio.dart';

Dio _service() {
  Dio dio = new Dio();
  dio.options.baseUrl = 'http://10.0.2.2:3000';
  dio.options.connectTimeout = 10000;
  dio.options.receiveTimeout = 3000;
  return dio;
}

Future<dynamic> post(String path, Map<String, dynamic> parameters) async {
  Response response = await _service().post(path, data: parameters);
  if (response.statusCode == 201) {
    return response.statusCode;
  }
}

Future<dynamic> get(String path) async {
  Response response = await _service().get(path);
  if (response.statusCode == 200) {
    return response.data;
  } else {
    print(response.data);
  }
}