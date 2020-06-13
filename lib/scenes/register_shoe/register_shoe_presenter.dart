import 'package:palestra_introducao/common/di/Injection.dart';
import 'package:palestra_introducao/repository/shoe/shoe_repository.dart';
import 'package:palestra_introducao/scenes/register_shoe/register_shoe_contract.dart';

class RegisterShoePresenter {
  RegisterShoeContract _view;
  ShoeRepository _repository;

  RegisterShoePresenter(this._view) {
    this._repository = Injector().repositoryShoe;
  }

  register(title, slug, description, price, image) async {
    this._view.showLoading();
    var request = await _repository.register(title, slug, description, int.parse(price), image);
    this._view.hideLoading();
    if (request.message == "Product has saved with success!") {
      this._view.registerSuccess();
    } else {
      this._view.showError(request.message);
    }
  }

}
