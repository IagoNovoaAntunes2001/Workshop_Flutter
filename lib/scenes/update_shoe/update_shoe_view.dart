import 'package:flutter/material.dart';
import 'package:palestra_introducao/common/components/custom_alert_dialog.dart';
import 'package:palestra_introducao/common/components/custom_buttom.dart';
import 'package:palestra_introducao/common/components/custom_text_form_field.dart';
import 'package:palestra_introducao/model/shoe/ShoesResult.dart';
import 'package:palestra_introducao/scenes/update_shoe/update_shoe_contract.dart';
import 'package:palestra_introducao/scenes/update_shoe/update_shoe_presenter.dart';

class UpdateShoeWidget extends StatefulWidget {
  ShoesResult data;

  UpdateShoeWidget(this.data);

  @override
  _UpdateShoeWidgetState createState() => _UpdateShoeWidgetState();
}

class _UpdateShoeWidgetState extends State<UpdateShoeWidget>
    implements UpdateShoeContract {
  UpdateShoePresenter _presenter;
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
    this._presenter = new UpdateShoePresenter(this);
    super.initState();
    _setDefaultValue();
  }

  _setDefaultValue() {
    _title.text = widget.data.title;
    _slug.text = widget.data.slug;
    _description.text = widget.data.description;
    _price.text = widget.data.price.toString();
    _image.text = widget.data.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Atualizar'),
          centerTitle: true,
        ),
        body: _buildBodyOfView(),
      ),
    );
  }

  Widget _buildBodyOfView() {
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.center,
        child: _buildContainerOfAlign(),
      ),
    );
  }

  Widget _buildContainerOfAlign() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: _buildFormOfContainer(),
    );
  }

  Widget _buildFormOfContainer() {
    return Form(
      key: _formKey,
      child: _buildColumnOfForm(),
    );
  }

  Widget _buildColumnOfForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
          'Editar',
          isLoading: isLoading,
          onPressed: _buildOnPressOfButton,
          backGroundColor: Colors.blueGrey,
        ),
      ],
    );
  }

  _buildOnPressOfButton() {
    if (!_formKey.currentState.validate()) return;

    this._presenter.update(_title.text, _slug.text, _description.text,
        _price.text, _image.text, widget.data.id);
  }

  @override
  void showError(String error) {}

  @override
  void showSuccess() {
    var alertDialog = _buildAlertDialogSuccess();
    showDialog(context: context, builder: (_) => alertDialog);
  }

  Widget _buildAlertDialogSuccess() {
    return CustomAlertDialogWidget(
      'Sucesso',
      'Tenis alterado com sucesso!',
      titleButtonFirst: 'Ok',
      fistColor: Colors.green,
      onPressedFirstButton: () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      },
    );
  }
}
