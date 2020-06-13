import 'package:palestra_introducao/common/di/Injection.dart';
import 'package:palestra_introducao/repository/shoe/shoe_repository.dart';
import 'package:palestra_introducao/scenes/list_shoe/list_shoe_contract.dart';

class ListShoePresenter {
  ListShoeContract _view;
  ShoeRepository _repository;

  ListShoePresenter(this._view) {
    this._repository = Injector().repositoryShoe;
  }

  findAll() async {
    this._view.showLoading();
    var request = await _repository.find();
    this._view.hideLoading();
    if (request != null) {
      this._view.showListUser(request);
    } else {
      this._view.showError('Erro');
    }
  }
}
