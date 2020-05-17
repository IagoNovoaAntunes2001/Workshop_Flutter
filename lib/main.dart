// Importação desse pacote é necessário pois nos dá o acesso aos widgets do dart
// Tanto quanto do Material Theme
import 'package:flutter/material.dart';
import 'package:palestra_introducao/scenes/home_view.dart';

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
        home: HomeWidget(),
    );
  }
}
