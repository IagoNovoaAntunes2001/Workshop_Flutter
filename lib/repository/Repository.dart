import 'package:dio/dio.dart';

class Repository {
  Dio _service() {
    Dio dio = new Dio();
    dio.options.baseUrl = 'http://10.0.2.2:3000';
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 3000;
    dio.options.headers = {"Content-Type": "application/json"};
    return dio;
  }

  Future<dynamic> get(String path) async {
    Response response = await _service().get(path);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return response.data;
    }
  }

  Future<dynamic> post(String path, Map<String, dynamic> parameters) async {
    Response response = await this._service().post(path, data: parameters);
    if (response.statusCode == 201) {
      return response.data;
    } else {
      return response.data;
    }
  }
}

/*
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
    print(response.data);
    return response.statusCode;
  } else {
    print(response.data);
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

Future<dynamic> put(path, Map<String, dynamic> parameters, id) async {
  print('Parametors');
  print(parameters);
  Response response = await _service().put(path + "/" + id, data: parameters);
  if (response.statusCode == 200) {
    print(response.data);
    return response.statusCode;
  } else {
    print(response.data);
    return response.statusCode;
  }
}

Future<dynamic> delete(path, id) async {
  Response response = await _service().delete(path, data: {"id": id});
  if (response.statusCode == 200) {
    print(response.data);
    return response.statusCode;
  } else {
    print(response.data);
    return response.statusCode;
  }
}
 */