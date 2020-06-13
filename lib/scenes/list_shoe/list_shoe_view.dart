import 'package:flutter/material.dart';
import 'package:palestra_introducao/common/components/loadingWidget.dart';
import 'package:palestra_introducao/model/shoe/ShoesResult.dart';
import 'package:palestra_introducao/scenes/list_shoe/list_shoe_contract.dart';
import 'package:palestra_introducao/scenes/list_shoe/list_shoe_presenter.dart';
import 'package:palestra_introducao/scenes/update_shoe/update_shoe.dart';

class ListShoesWidget extends StatefulWidget {
  @override
  _ListShoesWidgetState createState() => _ListShoesWidgetState();
}

class _ListShoesWidgetState extends State<ListShoesWidget>
    implements ListShoeContract {
  ListShoePresenter _presenter;

  bool isLoading = true;
  List<ShoesResult> listShoes = new List<ShoesResult>();

  @override
  void initState() {
    this._presenter = new ListShoePresenter(this);
    this._presenter.findAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de tênis'),
        centerTitle: true,
      ),
      body: _buildBodyOfView(),
    );
  }

  Widget _buildBodyOfView() {
    return isLoading
        ? LoadingWidget()
        : Container(
            padding: EdgeInsets.all(8.0),
            child: _buildListView(),
          );
  }

  Widget _buildListView() {
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
    return ListTile(
      leading: Image.network('${listShoes[index].imageUrl},'),
      trailing: Text(
        'R\$: ${listShoes[index].price}',
        style: TextStyle(
            color: Colors.green, fontSize: 16.0, fontWeight: FontWeight.w900),
      ),
      title: Text(
        listShoes[index].title,
        style: TextStyle(
            color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        listShoes[index].description,
        style: TextStyle(
            color: Colors.grey[600],
            fontSize: 15.0,
            fontWeight: FontWeight.w900),
      ),
      isThreeLine: true,
      enabled: listShoes[index].active,
      onTap: () async {
        final route = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UpdateShoesWidget(listShoes[index]),
          ),
        );
      },
      //onLongPress: () async {
      //var request = await delete('/products', data['_id']);
      //print(request);
      //if (request == 200) {
      // setState(() {
      //shoesFuture = _getShoes();
      //});
      // }
      //},
    );
  }

  @override
  void hideLoading() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  void showError(String error) {
    print(error);
  }

  @override
  void showListUser(List<ShoesResult> listResults) {
    listShoes = listResults;
    print(listShoes[0].id);
    //print(listShoes);
    print(listShoes.length);
  }

  @override
  void showLoading() {
    setState(() {
      isLoading = true;
    });
  }
}
