import 'package:palestra_introducao/common/di/Injection.dart';
import 'package:palestra_introducao/repository/shoe/shoe_repository.dart';
import 'package:palestra_introducao/scenes/update_shoe/update_shoe_contract.dart';

class UpdateShoePresenter {

  UpdateShoeContract _view;
  ShoeRepository _repository;

  UpdateShoePresenter(this._view) {
    this._repository = Injector().repositoryShoe;
  }

  update(title, slug, description, price, image, id) async {
    var request = await this._repository.update(title, slug, description, int.parse(price), image, id);
    if (request.message == 'Product has update with success!') {
      this._view.showSuccess();
    } else {
      this._view.showError(request.message);
    }
  }

}