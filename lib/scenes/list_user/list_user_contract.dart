abstract class ListUserContract {

  void showListUser(List<Map> request);

  void showLoading();

  void hideLoading();

  void showError(String error);

}