import 'package:palestra_introducao/model/user/UserResult.dart';

abstract class ListUserContract {

  void showListUser(List<UserResult> resultUsers);

  void showError(String error);

}