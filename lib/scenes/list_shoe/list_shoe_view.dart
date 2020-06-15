import 'package:flutter/material.dart';
import 'package:palestra_introducao/common/components/custom_alert_dialog.dart';
import 'package:palestra_introducao/common/components/custom_list_tile.dart';
import 'package:palestra_introducao/common/components/custom_view.dart';
import 'package:palestra_introducao/common/components/loadingWidget.dart';
import 'package:palestra_introducao/model/shoe/ShoesResult.dart';
import 'package:palestra_introducao/scenes/list_shoe/list_shoe_contract.dart';
import 'package:palestra_introducao/scenes/list_shoe/list_shoe_presenter.dart';
import 'package:palestra_introducao/scenes/update_shoe/update_shoe_view.dart';

class ListShoesWidget extends StatefulWidget {
  @override
  _ListShoesWidgetState createState() => _ListShoesWidgetState();
}

class _ListShoesWidgetState extends State<ListShoesWidget>
    implements ListShoeContract {
  ListShoePresenter _presenter;

  List<ShoesResult> listShoes = new List<ShoesResult>();
  int _atIndex = 0;

  @override
  void initState() {
    this._presenter = new ListShoePresenter(this);
    this._presenter.findAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lista de tênis'),
          centerTitle: true,
        ),
        body: _buildBodyOfView(),
      ),
    );
  }

  Widget _buildBodyOfView() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: _buildFutureBuilder(),
    );
  }

  Widget _buildFutureBuilder() {
    return FutureBuilder(
      future: this._presenter.findAll(),
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
    return listShoes.length == 0
        ? CustomViewWidget('Não há itens cadastrados.')
        : Container(
            child: _buildListViewBuilder(),
          );
  }

  Widget _buildListViewBuilder() {
    return ListView.builder(
      itemCount: listShoes.length,
      itemBuilder: (context, index) {
        return _buildCardOfListView(index, context);
      },
    );
  }

  Widget _buildCardOfListView(int index, BuildContext context) {
    return Card(
      color: Colors.grey[100],
      margin: EdgeInsets.all(8.0),
      child: _buildListTileOfCard(index, context),
    );
  }

  Widget _buildListTileOfCard(int index, BuildContext context) {
    return CustomLisTileWidget(
        '${listShoes[index].imageUrl}',
        '${listShoes[index].price}',
        '${listShoes[index].title}',
        subtitle: '${listShoes[index].description}',
        enabled: listShoes[index].active,
        onTap: _onTap(index),
        onLongPress: _onLongPressDelete(index));
  }

  Function _onTap(int index) {
    return () async {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UpdateShoeWidget(listShoes[index]),
        ),
      );
    };
  }

  Function _onLongPressDelete(int index) {
    return () async {
      var alert = _buildAlertDialog(index);
      showDialog(context: context, builder: (_) => alert);
    };
  }

  Widget _buildAlertDialog(int index) {
    return CustomAlertDialogWidget(
      'Deseja mesmo excluir?',
      'Por favor, confirme ou cancele esta ação',
      titleButtonFirst: 'Cancelar',
      fistColor: Colors.red,
      secondColor: Colors.green,
      onPressedFirstButton: () => Navigator.pop(context),
      titleSecondButton: 'Confirmar',
      onPressedSecondButton: () {
        _atIndex = index;
        this._presenter.deleteShoe(listShoes[index].id);
        Navigator.pop(context);
      },
    );
  }

  @override
  void showError(String error) {
    var alertDialog = _buildAlertDialogSuccess();
    showDialog(context: context, builder: (_) => alertDialog);
  }

  Widget _buildAlertDialogSuccess() {
    return CustomAlertDialogWidget(
      'Erro',
      'Houve algum erro!',
      titleButtonFirst: 'Ok',
      fistColor: Colors.red,
      onPressedFirstButton: () => Navigator.pop(context),
    );
  }

  @override
  void showListUser(List<ShoesResult> listResults) {
    if (listResults.length > 0) {
      listShoes = listResults;
    }
  }

  @override
  void showSuccess(String message) {
    var alertDialog = CustomAlertDialogWidget(
      'Sucesso',
      'Produto deletado com sucesso!',
      titleButtonFirst: 'Ok',
      fistColor: Colors.green,
      onPressedFirstButton: () => Navigator.pop(context),
    );
    showDialog(context: context, builder: (_) => alertDialog);
    setState(() {
      listShoes.removeAt(_atIndex);
    });
  }
}
