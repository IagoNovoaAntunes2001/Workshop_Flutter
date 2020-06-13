import 'package:flutter/material.dart';
import 'package:palestra_introducao/common/components/custom_alert_dialog.dart';
import 'package:palestra_introducao/common/components/custom_buttom.dart';
import 'package:palestra_introducao/common/components/custom_text_form_field.dart';
import 'package:palestra_introducao/scenes/list_user/list_user_view.dart';
import 'package:palestra_introducao/scenes/register/register_contract.dart';
import 'package:palestra_introducao/scenes/register/register_presenter.dart';

class UsersWidget extends StatefulWidget {
  @override
  _UsersWidgetState createState() => _UsersWidgetState();
}

class _UsersWidgetState extends State<UsersWidget> implements RegisterContract {
  RegisterPresenter _presenter;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _cpf = new TextEditingController();

  bool isLoading = false;
  bool isFieldsOn = true;

  @override
  void initState() {
    this._presenter = new RegisterPresenter(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Users'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: _buildBodyOfView(context),
        ),
        floatingActionButton: _buildFloatingActionButtom(context),
      ),
    );
  }

  Widget _buildFloatingActionButtom(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.list),
      onPressed: () => _pushToList(),
    );
  }

  Widget _buildBodyOfView(ctx) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: _formOfBody(ctx),
    );
  }

  Widget _formOfBody(ctx) {
    return Form(
      key: _formKey,
      child: _buildColumnOfForm(ctx),
    );
  }

  Widget _buildColumnOfForm(ctx) {
    return Column(
      children: <Widget>[
        TextFormWidget(
          _name,
          'Name',
          (val) => val.isEmpty ? 'Favor entrar com o nome' : null,
          isEnabled: isFieldsOn,
        ),
        SizedBox(
          height: 15,
        ),
        TextFormWidget(
          _email,
          'E-mail',
          (val) => val.isEmpty ? 'Favor entrar com o E-mail' : null,
          isEnabled: isFieldsOn,
        ),
        SizedBox(
          height: 15,
        ),
        TextFormWidget(
          _cpf,
          'Cpf',
          (val) => val.isEmpty ? 'Favor entrar com o CPF' : null,
          isEnabled: isFieldsOn,
        ),
        SizedBox(
          height: 15,
        ),
        CustomButtom(
          'Salvar',
          isLoading: isLoading,
          onPressed: _onPressedButtom,
          backGroundColor: Colors.blueGrey,
        ),
      ],
    );
  }

  void _onPressedButtom() {
    if (!_formKey.currentState.validate()) return;

    this._presenter.save(_name.text, _email.text, _cpf.text);
  }

  @override
  void hideLoading() {
    setState(() {
      isLoading = false;
      isFieldsOn = true;
    });
  }

  @override
  void showError(String error) {
    var alertDialog = CustomAlertDialogWidget('Erro', '$error!');
    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  void registerSuccess() async {
    var alertDialog = CustomAlertDialogWidget('Sucesso', 'Usuário registrado!');
    await showDialog(context: context, builder: (_) => alertDialog);
    _pushToList();
  }

  Future _pushToList() {
    return Navigator.push(
        context, MaterialPageRoute(builder: (_) => ListUserWidget()));
  }

  @override
  void showLoading() {
    setState(() {
      isLoading = true;
      isFieldsOn = false;
    });
  }
}