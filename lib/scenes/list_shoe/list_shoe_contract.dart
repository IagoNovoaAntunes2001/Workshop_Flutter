import 'package:palestra_introducao/model/shoe/ShoesResult.dart';

abstract class ListShoeContract {
  void showListUser(List<ShoesResult> listShoes);

  void showSuccess(String message);

  void showError(String error);
}
