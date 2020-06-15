import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palestra_introducao/common/components/custom_alert_dialog.dart';
import 'package:palestra_introducao/common/components/custom_buttom.dart';
import 'package:palestra_introducao/common/components/custom_text_form_field.dart';
import 'package:palestra_introducao/scenes/list_shoe/list_shoe_view.dart';
import 'package:palestra_introducao/scenes/register_shoe/register_shoe_contract.dart';
import 'package:palestra_introducao/scenes/register_shoe/register_shoe_presenter.dart';

class RegisterShoeWidget extends StatefulWidget {
  @override
  _RegisterShoeWidgetState createState() => _RegisterShoeWidgetState();
}

class _RegisterShoeWidgetState extends State<RegisterShoeWidget>
    implements RegisterShoeContract {
  RegisterShoePresenter _presenter;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _title = TextEditingController();
  TextEditingController _slug = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _image = TextEditingController();

  bool isLoading = false;
  bool isFieldsOn = true;

  @override
  void initState() {
    this._presenter = new RegisterShoePresenter(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('New Shoe'),
          centerTitle: true,
        ),
        body: _buildBodyOfView(context),
        floatingActionButton: _buildFloatingActionButton(context),
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _pushToListShoes(),
      backgroundColor: Colors.blueAccent,
      splashColor: Colors.grey,
      child: Icon(Icons.line_style),
    );
  }

  Widget _buildBodyOfView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: _buildSingleChildScrollView(context),
    );
  }

  Widget _buildSingleChildScrollView(BuildContext context) {
    return SingleChildScrollView(
      child: _buildForm(context),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: _buildColumnOfForm(context),
    );
  }

  Widget _buildColumnOfForm(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormWidget(
          _title,
          'Titutlo',
          (val) => val.isEmpty ? 'Por favor digitar o titulo' : null,
          isEnabled: isFieldsOn,
        ),
        TextFormWidget(
          _slug,
          'Slug',
          (val) => val.isEmpty ? 'Por favor digitar o slug' : null,
          isEnabled: isFieldsOn,
        ),
        TextFormWidget(
          _description,
          'Descrição',
          (val) => val.isEmpty ? 'Por favor digitar a Descrição' : null,
          isEnabled: isFieldsOn,
        ),
        TextFormWidget(_price, 'Preço',
            (val) => val.isEmpty ? 'Por favor digitar o preço' : null,
            isEnabled: isFieldsOn, type: TextInputType.number),
        TextFormWidget(
          _image,
          'Url',
          (val) => val.isEmpty ? 'Por favor digitar a Url' : null,
          isEnabled: isFieldsOn,
        ),
        CustomButton(
          'Enviar',
          isLoading: isLoading,
          onPressed: _onPressedButton,
          backGroundColor: Colors.blueGrey,
        ),
      ],
    );
  }

  _onPressedButton() {
    if (!_formKey.currentState.validate()) return;

    this._presenter.register(
        _title.text, _slug.text, _description.text, _price.text, _image.text);
  }

  void _cleanFields() {
    _title.text = '';
    _slug.text = '';
    _description.text = '';
    _price.text = '';
    _image.text = '';
  }

  @override
  void registerSuccess() async {
    var alertDialog = _buildAlertDialogSuccess();
    await showDialog(context: context, builder: (_) => alertDialog);
    _cleanFields();
    _pushToListShoes();
  }

  Widget _buildAlertDialogSuccess() {
    return CustomAlertDialogWidget(
      'Sucesso',
      'Tenis registrado com sucesso!',
      titleButtonFirst: 'Ok',
      fistColor: Colors.green,
      onPressedFirstButton: () => Navigator.pop(context),
    );
  }

  void _pushToListShoes() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => ListShoesWidget()));
  }

  @override
  void showError(String error) {
    var alertDialog = _buildAlertDialogError(error);
    showDialog(context: context, builder: (_) => alertDialog);
  }

  Widget _buildAlertDialogError(String error) {
    return CustomAlertDialogWidget(
      'Erro',
      'Ocorreu algum erro: $error!',
      titleButtonFirst: 'Ok',
      fistColor: Colors.red,
      onPressedFirstButton: () => Navigator.pop(context),
    );
  }

  @override
  void hideLoading() {
    setState(() {
      isLoading = false;
      isFieldsOn = true;
    });
  }

  @override
  void showLoading() {
    setState(() {
      isLoading = false;
      isFieldsOn = true;
    });
  }
}
