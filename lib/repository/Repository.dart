import 'package:dio/dio.dart';
import 'package:palestra_introducao/repository/Repository_contract.dart';

class Repository implements RepositoryContract {
  Dio _service() {
    Dio dio = new Dio();
    dio.options.baseUrl = 'http://10.0.2.2:3000';
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 3000;
    dio.options.headers = {"Content-Type": "application/json"};
    return dio;
  }

  @override
  Future<dynamic> authenticate(String path) async {
    Map<String, dynamic> parameters = new Map();
    parameters['email'] = "iago.novoa.antunes@gmail.com";
    parameters['password'] = "iago123";

    Response response = await this._service().post(path, data: parameters);
    if (response.statusCode == 201) {
      return response.data;
    } else {
      return response.data;
    }
  }

  @override
  Future<dynamic> post(String path, Map<String, dynamic> parameters) async {
    var token = await authenticate('/authenticate');
    parameters['token'] = token['token'];
    Response response = await this._service().post(path, data: parameters);
    if (response.statusCode == 201) {
      return response.data;
    } else {
      return response.data;
    }
  }

  @override
  Future<dynamic> get(String path) async {
    Response response = await _service().get(path);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return response.data;
    }
  }

  @override
  Future<dynamic> put(path, Map<String, dynamic> parameters, id) async {
    var token = await authenticate('/authenticate');
    parameters['token'] = token['token'];
    Response response = await _service().put(path + "/" + id, data: parameters);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return response.data;
    }
  }

  @override
  Future<dynamic> delete(String path, id) async {
    var token = await authenticate('/authenticate');
    Response response = await _service().delete(path, data: {'token': '${token['token']}', 'id': id});
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return response.data;
    }
  }
}
