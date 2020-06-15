abstract class RepositoryContract {

 Future<dynamic> authenticate(String path);

 Future<dynamic> post(String path, Map<String, dynamic> parameters);

 Future<dynamic> get(String path);

 Future<dynamic> put(path, Map<String, dynamic> parameters, id);

 Future<dynamic> delete(String path, id);

}