import 'package:flutter/material.dart';
import 'package:palestra_introducao/repository/database/BaseCache.dart';
import 'package:palestra_introducao/repository/model/User.dart';

class ListUsers extends StatefulWidget {
  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  Future userFuture;
  User user;
  int quantitityUser = 0;

  @override
  void initState() {
    super.initState();
    userFuture = _getUser();
  }

  _getUser() async {
    print(findAll('user'));
    print(findAll('user').then((f) => quantitityUser = f.length));
    return await findAll('user');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Users'),
        centerTitle: true,
      ),
      body: listWidget(),
    );
  }

  Widget listWidget() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: FutureBuilder(
          future: userFuture,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                return Text('ativo');
              case ConnectionState.waiting:
                return Text('Esperando os dados');
              case ConnectionState.done:
                return ListView.builder(
                    itemCount: quantitityUser,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.grey[200],
                        child: ListTile(
                          onTap: () => print('cliquei'),
                          title: Text(snapshot.data[index]['email']),
                          leading: Text(snapshot.data[index]['name']),
                          subtitle: Text(snapshot.data[index]['cpf']),
                        ),
                      );
                    });
              default:
                return Text('Default');
            }
          },
        ),
      ),
    );
  }
}
