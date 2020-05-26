import 'package:flutter/material.dart';
import 'package:palestra_introducao/repository/database/BaseCache.dart';
import 'package:palestra_introducao/repository/model/User.dart';
import 'package:palestra_introducao/scenes/user/list_user.dart';

class UsersWidget extends StatefulWidget {
  @override
  _UsersWidgetState createState() => _UsersWidgetState();
}

class _UsersWidgetState extends State<UsersWidget> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _cpf = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              _buildTextFormField(_name, 'Name', (val) => val.isEmpty ? 'Favor entrar com o nome' : null,),
              SizedBox(height: 15,),
              _buildTextFormField(_email, 'E-mail', (val) => val.isEmpty ? 'Favor entrar com o E-mail' : null,),
              SizedBox(height: 15,),
              _buildTextFormField(_cpf, 'Cpf', (val) => val.isEmpty ? 'Favor entrar com o CPF' : null,),
              SizedBox(height: 15,),
              RaisedButton(
                  child: Text('Salvar'),
                  onPressed: () {
                    if (_formKey.currentState.validate()){

                      User user = User(name:_name.text, email: _email.text, cpf: _cpf.text);
                      save('User', user).then((o) {
                        if (o != null || o > 0)
                          Navigator.pop(context);
                        else
                          print('error');
                      });
                    }
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.list),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ListUsers())),
      ),
    );
  }

  TextFormField _buildTextFormField(TextEditingController controller, String title, Function validator) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: title),
      keyboardType: TextInputType.text,
      validator: validator,
    );
  }
}
