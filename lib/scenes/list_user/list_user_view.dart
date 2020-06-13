import 'package:flutter/material.dart';
import 'package:palestra_introducao/common/components/custom_alert_dialog.dart';
import 'package:palestra_introducao/common/components/loadingWidget.dart';
import 'package:palestra_introducao/scenes/list_user/list_user_contract.dart';
import 'package:palestra_introducao/scenes/list_user/list_user_presenter.dart';

class ListUserWidget extends StatefulWidget {
  @override
  _ListUserWidgetState createState() => _ListUserWidgetState();
}

class _ListUserWidgetState extends State<ListUserWidget>
    implements ListUserContract {
  ListUserPresenter _presenter;
  Future userFuture;
  List<Map> listUser = new List<Map>();

  bool isLoading = false;

  @override
  void initState() {
    this._presenter = new ListUserPresenter(this);
    this._presenter.listUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('List Users'),
          centerTitle: true,
        ),
        body: _listWidget(),
      ),
    );
  }

  Widget _listWidget() {
    return isLoading
        ? LoadingWidget()
        : Padding(
            padding: EdgeInsets.all(8.0),
            child: _buildContainerOfList(),
          );
  }

  Widget _buildContainerOfList() {
    return Container(
      child: _buildListViewOfCotainer(),
    );
  }

  Widget _buildListViewOfCotainer() {
    return ListView.builder(
      itemCount: listUser.length,
      itemBuilder: (context, index) {
        return _buildCardOfListBuilder(index);
      },
    );
  }

  Widget _buildCardOfListBuilder(index) {
    return Card(
      color: Colors.grey[200],
      child: _buildListTileOfCard(index),
    );
  }

  Widget _buildListTileOfCard(index) {
    return ListTile(
      onTap: () => print('Click'),
      title: Text(listUser[index]['email']),
      leading: Text(listUser[index]['name']),
      subtitle: Text(listUser[index]['cpf']),
    );
  }

  @override
  void hideLoading() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  void showListUser(List<Map> list) {
    print('listagem');
    setState(() {
      listUser = list;
    });
    print(listUser);
  }

  @override
  void showLoading() {
    setState(() {
      isLoading = true;
    });
  }

  @override
  void showError(String error) {
    var alertDialog = CustomAlertDialogWidget('Erro', '$error');
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
