import 'package:flutter/material.dart';
import 'package:palestra_introducao/common/components/custom_alert_dialog.dart';
import 'package:palestra_introducao/common/components/custom_buttom.dart';
import 'package:palestra_introducao/common/components/custom_text_form_field.dart';
import 'package:palestra_introducao/model/shoe/ShoesResult.dart';
import 'package:palestra_introducao/scenes/update_shoe/update_shoe_contract.dart';
import 'package:palestra_introducao/scenes/update_shoe/update_shoe_presenter.dart';
import '../../extension/custom_color_scheme.dart';

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
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        TextFormWidget(
          _slug,
          'Slug',
          (val) => val.isEmpty ? 'Por favor digitar o slug' : null,
          isEnabled: isFieldsOn,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        TextFormWidget(
          _description,
          'Descrição',
          (val) => val.isEmpty ? 'Por favor digitar a Descrição' : null,
          isEnabled: isFieldsOn,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
        TextFormWidget(_price, 'Preço',
            (val) => val.isEmpty ? 'Por favor digitar o preço' : null,
            isEnabled: isFieldsOn, type: TextInputType.number),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
        TextFormWidget(
          _image,
          'Url',
          (val) => val.isEmpty ? 'Por favor digitar a Url' : null,
          isEnabled: isFieldsOn,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
        CustomButton(
          'Editar',
          isLoading: isLoading,
          onPressed: _buildOnPressOfButton,
          backGroundColor: Theme.of(context).colorScheme.lightBlue,
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
  void showError(String error) {
    var alertDialog = _buildAlertDialog('Erro!', error, Theme.of(context).colorScheme.success);
    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  void showSuccess() {
    var alertDialog = _buildAlertDialog(
        'Sucesso!', 'Tenis alterado com sucesso.', Theme.of(context).colorScheme.success);
    showDialog(context: context, builder: (_) => alertDialog);
  }

  Widget _buildAlertDialog(title, message, color) {
    return CustomAlertDialogWidget(
      '$title',
      '$message',
      titleButtonFirst: 'Ok',
      fistColor: color,
      onPressedFirstButton: () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      },
    );
  }
}
