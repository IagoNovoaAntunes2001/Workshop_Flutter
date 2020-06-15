import 'package:palestra_introducao/common/di/Injection.dart';
import 'package:palestra_introducao/repository/cache/BaseCache.dart';
import 'package:palestra_introducao/scenes/list_user/list_user_contract.dart';

class ListUserPresenter {

  ListUserContract _view;
  ICache _baseCache = Injector.singleton.baseCache;

  ListUserPresenter(this._view) {
    return;
  }

  listUser() async {
    var request = await _baseCache.find('user');
    if (request != null) {
      this._view.showListUser(request);
    } else {
      this._view.showError(request.toString());
    }
  }

}