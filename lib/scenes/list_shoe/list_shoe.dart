import 'package:flutter/material.dart';
import 'package:palestra_introducao/repository/Repository.dart';
import 'package:palestra_introducao/scenes/update_shoe/update_shoe.dart';

class ListShoesWidget extends StatefulWidget {
  @override
  _ListShoesWidgetState createState() => _ListShoesWidgetState();
}

class _ListShoesWidgetState extends State<ListShoesWidget> {
  Future shoesFuture;
  int mapLength = 0;

  @override
  void initState() {
    super.initState();
    shoesFuture = _getShoes();
  }

  _getShoes() async {
    //var map = await get('/products');
    var map = '';
    print(map);
    mapLength = map.length;
    print(map.length);
    return map;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de tênis'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: shoesFuture,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('none');
              break;
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.active:
              return Text('Ativo');
              break;
            case ConnectionState.done:
              return ListView.builder(
                itemCount: mapLength,
                itemBuilder: (context, index) {
                  var data = snapshot.data[index];
                  return Card(
                    color: Colors.grey[100],
                    margin: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.network(data['image_url']),
                      trailing: Text(
                        'R\$ ${data['price'].toString()}',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w900),
                      ),
                      title: Text(
                        data['title'],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        data['description'],
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15.0,
                            fontWeight: FontWeight.w900),
                      ),
                      isThreeLine: true,
                      enabled: data['active'],
                      onTap: () async {
                        final route = await Navigator.push(context, MaterialPageRoute(
                          builder: (context) => UpdateShoesWidget(data)
                        ));

                        print(route);

                        setState(() {
                          if (route == true || route == null) {
                            shoesFuture = _getShoes();
                          }
                        });

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
                    ),
                  );
                },
              );
              break;
            default:
              return Text('n foi');
          }
        },
      ),
    );
  }
}
