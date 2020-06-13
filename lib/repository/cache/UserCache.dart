import 'package:palestra_introducao/repository/cache/BaseCache.dart';

class UserCache extends BaseCache {

  Future findAll() async {
    return this.find('user');
  }

}
