import 'package:palestra_introducao/common/di/Injection.dart';
import 'package:palestra_introducao/model/user/User.dart';
import 'package:palestra_introducao/repository/cache/BaseCache.dart';
import 'package:palestra_introducao/scenes/register_user/register_contract.dart';

class RegisterPresenter {
  RegisterContract _view;

  ICache _baseCache = Injector.singleton.baseCache;
  User _user;

  RegisterPresenter(this._view) {
    this._user = Injector().user;
  }

  save(name, email, cpf) async {
    _user.name = name;
    _user.cpf = cpf;
    _user.email = email;
    this._view.showLoading();
    var request = await this._baseCache.save('user', _user);
    this._view.hideLoading();
    if (request != 0 && request != null) {
      this._view.registerSuccess();
    } else {
      this._view.showError(request.toString());
    }
    print(request);
  }
}
