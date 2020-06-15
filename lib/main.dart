// Importação desse pacote é necessário pois nos dá o acesso aos widgets do dart
// Tanto quanto do Material Theme
import 'package:flutter/material.dart';
import 'package:palestra_introducao/scenes/home/home_view.dart';

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
      home: SafeArea(child: HomeWidget()),
    );
  }
}

// Exemplos da palestra.

Widget home() {
  return Padding(
    padding: const EdgeInsets.all(100.0),
    child: Text('Home', style: TextStyle(fontSize: 42.0),),
  );
}

Widget exampleImages() {
  return Container(
    width: double.infinity,
    height: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.network(
          'https://www.hostgator.com.br/blog/wp-content/uploads/2018/04/teste-ab-e-por-que-comecar-a-usar-blog.png',
          width: 150,
          height: 150,
        ),
        Image.asset(
          'lib/assets/images/11_02.png',
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
      ],
    ),
  );
}

Widget exampleWidgetsUtils() {
  return Container(
    padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
    margin: EdgeInsets.fromLTRB(30, 40, 30, 40),
    width: double.infinity,
    height: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('Ola', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
        RaisedButton(
          color: Colors.red,
          padding: EdgeInsets.all(24),
          disabledTextColor: Colors.green,
          disabledColor: Colors.black,
          child: Text('Botao'),
          textColor: Colors.yellow,
          onPressed: () => print('Pressionei'),
          onLongPress: () => print('long press'),
        ),
        FlatButton(
          child: Text('FlatButton'),
          textColor: Colors.blue,
          onPressed: () => print('Pressionei'),
          onLongPress: () => print('long press'),
          hoverColor: Colors.black,
          padding: EdgeInsets.all(24),
        ),
        Switch(
          value: false,
          onChanged: (value) => print(value),
        ),
        InkWell(
          onTap: () => print('ola'),
          child: Text('huahuasuh'),
        ),
      ],
    ),
  );
}

Widget stackExample() {
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

Widget rowExample() {
  return Container(
    width: double.infinity,
    height: double.infinity,
    child: Row(
      textBaseline: TextBaseline.alphabetic,
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

Widget columnExample() {
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

Widget containerExample() {
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
