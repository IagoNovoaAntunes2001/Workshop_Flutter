import 'package:palestra_introducao/model/shoe/ShoesResult.dart';

abstract class ListShoeContract {
  void showListUser(List<ShoesResult> listShoes);

  void showLoading();

  void hideLoading();

  void showError(String error);
}
