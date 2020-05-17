import 'package:flutter/material.dart';
import 'package:palestra_introducao/scenes/new_shoes.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  var contador = 0;

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
                  builder: (context) => ShoesWidget(),
                ),
              );
            },
            child: Text('Button'),
          ),
        ],
      ),
    );
  }
}
