import 'package:flutter/material.dart';
import 'package:palestra_introducao/common/components/custom_alert_dialog.dart';
import 'package:palestra_introducao/common/components/custom_list_tile.dart';
import 'package:palestra_introducao/common/components/custom_view.dart';
import 'package:palestra_introducao/common/components/loadingWidget.dart';
import 'package:palestra_introducao/model/user/UserResult.dart';
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
  List<UserResult> listUser = new List<UserResult>();

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
        body: _buildContainerOfView(),
      ),
    );
  }

  Widget _buildContainerOfView() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: _buildFutureBuilder(),
    );
  }

  Widget _buildFutureBuilder() {
    return FutureBuilder(
      future: this._presenter.listUser(),
      builder: (context, snapshot) {
        return _buildSwitchOfFuture(snapshot);
      },
    );
  }

  Widget _buildSwitchOfFuture(snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.done:
        return _buildContainerOfFutre();
      case ConnectionState.none:
        return CustomViewWidget('Não há conexão.');
        break;
      case ConnectionState.waiting:
        return LoadingWidget();
        break;
      case ConnectionState.active:
        return CustomViewWidget('Ativo, sem dados.');
        break;
      default:
        return CustomViewWidget('Ocorreu algum problema com a conexão');
    }
  }

  Widget _buildContainerOfFutre() {
    return listUser.length == 0
        ? CustomViewWidget('Não há itens cadastrados.')
        : Container(
            child: _buildListViewBuilder(),
          );
  }

  Widget _buildListViewBuilder() {
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
    return CustomLisTileWidget(
      title: '${listUser[index].email}',
      leading: '${listUser[index].name}',
      subtitle: '${listUser[index].cpf}',
    );
  }

  @override
  void showListUser(List<UserResult> list) {
    listUser = list;
  }

  @override
  void showError(String error) {
    var alertDialog = _buildAlertDialogError(error);
    showDialog(context: context, builder: (_) => alertDialog);
  }

  Widget _buildAlertDialogError(String error) {
    return CustomAlertDialogWidget(
      'Erro',
      'Ocorreu algum erro: $error!',
      titleButtonFirst: 'Ok',
      fistColor: Colors.red,
      onPressedFirstButton: () => Navigator.pop(context),
    );
  }
}
