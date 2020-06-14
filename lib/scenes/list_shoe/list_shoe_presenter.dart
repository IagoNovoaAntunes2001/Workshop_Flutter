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
    var request = await _repository.find();
    if (request != null) {
      this._view.showListUser(request);
    } else {
      this._view.showError('Houve um erro ao carregar a lista.');
    }
  }

  deleteShoe(id) async {
    var request = await this._repository.deleteShoe(id);

    if (request.message == 'Product has delete with success!') {
      this._view.showSuccess('Produto deletado com sucesso');
    } else {
      this._view.showError('Erro ao deletar o produto');
    }
  }
}
