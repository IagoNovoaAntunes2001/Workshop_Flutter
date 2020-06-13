import 'package:palestra_introducao/model/User.dart';
import 'package:palestra_introducao/repository/cache/BaseCache.dart';
import 'package:palestra_introducao/repository/shoe/register_shoe_repository.dart';

class Injector {
  static final Injector singleton = new Injector._internal();

  factory Injector() {
    return singleton;
  }

  Injector._internal();

  ICache get baseCache => new BaseCache();

  User get user => new User();

  RegisterShoeRepository get repositoryShoe => new RegisterShoeRepository();

}
