// Importação desse pacote é necessário pois nos dá o acesso aos widgets do dart
// Tanto quanto do Material Theme
import 'package:flutter/material.dart';

// O método main é o principal método da aplicação, ele que complica nosso código dart
void main() {
  // Chamando esse método para rodar a aplicação
  // É necessário usar um widget como parâmetro
  runApp(
    MyApp(),
  );
}

// O widget raiz
class MyApp extends StatelessWidget {
  // O método build reconstrói a árvore de widegts se houver mudanças
  // e permite o hot reload
  @override
  Widget build(BuildContext context) {
    // Agora ao ínves de um Container estamos usando o widget MaterialApp
    // o qual é configurado para dar à nossa app um tema Material
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // O widget Scaffold define o layouta da home
      home: Scaffold(
        appBar: AppBar(
          title: Text('oi'),
        ),
        body: exampleWidgetsUtils(),
      ),
    );
  }

  Widget exampleWidgetsUtils() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Olá',
            style: TextStyle(fontSize: 30, color: Colors.green),
          ),
          RaisedButton(
            onPressed: () {},
            color: Colors.red,
            child: Text(
              'Olá',
              style: TextStyle(color: Colors.white),
            ),
          ),
          FlatButton(
            onPressed: (){},
            child: Text('FlatButton'),
          ),
          Switch(
            value: false,
            onChanged: (bool value) {
              print(value);
            },
          ),
        ],
      ),
    );
  }

  Widget StackExample() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),
          Container(
            width: 190,
            height: 190,
            color: Colors.green,
          ),
          Container(
            width: 180,
            height: 180,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget RowExample() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('abc'),
          Text('abc'),
          Text('abc'),
          Text('abc'),
          Text('abc'),
          Text('abc'),
        ],
      ),
    );
  }

  Widget ColumnExample() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('aaskglasjgklaskgljsa'),
          Text('aaskglasjgklaskgljsa'),
          Text('aaskglasjgklaskgljsa'),
          Text('aaskglasjgklaskgljsa'),
          Text('aaskglasjgklaskgljsa'),
          Text('aaskglasjgklaskgljsa'),
        ],
      ),
    );
  }

  Widget ContainerExample() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 300,
        height: 300,
        color: Colors.black,
        child: Center(
            child: Text(
          'Dentro do container',
          style: TextStyle(color: Colors.pink),
        )),
      ),
    );
  }
}
