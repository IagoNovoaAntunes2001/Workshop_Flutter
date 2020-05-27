import 'package:flutter/material.dart';
import 'package:palestra_introducao/scenes/shoes/new_shoe.dart';
import 'package:palestra_introducao/scenes/user/new_user.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  var contador = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: bodyOfHome(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          setState(() {
            contador++;
          });
          print(contador);
        },
      ),
    );
  }

  Widget bodyOfHome(context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Quantidade de vezes clicadas: $contador"),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UsersWidget(),
                ),
              );
            },
            child: Text('New User'),
          ),
          FlatButton(
            child: Text('New Shoe'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoesWidget(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
