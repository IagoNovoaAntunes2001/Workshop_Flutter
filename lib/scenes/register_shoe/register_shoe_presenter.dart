import 'package:palestra_introducao/common/di/Injection.dart';
import 'package:palestra_introducao/repository/shoe/register_shoe_repository.dart';
import 'package:palestra_introducao/scenes/register_shoe/register_shoe_contract.dart';

class RegisterShoePresenter {
  RegisterShoeContract _view;
  RegisterShoeRepository _repository;

  RegisterShoePresenter(this._view) {
    this._repository = Injector().repositoryShoe;
  }



}
