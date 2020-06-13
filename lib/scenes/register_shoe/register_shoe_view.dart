import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palestra_introducao/common/components/custom_buttom.dart';
import 'package:palestra_introducao/common/components/custom_text_form_field.dart';
import 'package:palestra_introducao/scenes/list_shoe/list_shoe.dart';
import 'package:palestra_introducao/scenes/register_shoe/register_shoe_contract.dart';
import 'package:palestra_introducao/scenes/register_shoe/register_shoe_presenter.dart';

class ShoesWidget extends StatefulWidget {
  @override
  _ShoesWidgetState createState() => _ShoesWidgetState();
}

class _ShoesWidgetState extends State<ShoesWidget> implements RegisterShoeContract {
  RegisterShoePresenter _presenter;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _title = TextEditingController();
  TextEditingController _slug = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _image = TextEditingController();

  @override
  void initState() {
    this._presenter = new RegisterShoePresenter(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Shoe'),
        centerTitle: true,
      ),
      body: _buildBodyOfView(context),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => ListShoesWidget())),
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
        ),
        TextFormWidget(
          _slug,
          'Slug',
          (val) => val.isEmpty ? 'Por favor digitar o slug' : null,
        ),
        TextFormWidget(
          _description,
          'Descrição',
          (val) => val.isEmpty ? 'Por favor digitar a Descrição' : null,
        ),
        TextFormWidget(_price, 'Preço',
            (val) => val.isEmpty ? 'Por favor digitar o preço' : null,
            type: TextInputType.number),
        TextFormWidget(
          _image,
          'Url',
          (val) => val.isEmpty ? 'Por favor digitar a Url' : null,
        ),
        CustomButton(
          'Enviar',
          isLoading: false,
          onPressed: _onPressedButton(context),
          backGroundColor: Colors.blueGrey,
        ),
      ],
    );
  }

  Function _onPressedButton(ctx) {
    return () {
      if (!_formKey.currentState.validate()) return;

      /*var request = ShoesRequest(
          title: _title.text,
          slug: _slug.text,
          description: _description.text,
          price: int.parse(_price.text),
          imageUrl: _image.text);
       */

      //var map = post('/products', request.toJson());

      /*print(
        map.then(
          (o) {
            if (o == 201 || o == "201") {
              _title.text = '';
              _description.text = '';
              _slug.text = '';
              _price.text = '';
              _image.text = '';

              Navigator.push(
                  ctx, MaterialPageRoute(builder: (ctx) => ListShoesWidget()));
            }
          },
        ),
      );*/
    };
  }

  @override
  void registerSuccess() {
    // TODO: implement registerSuccess
  }

  @override
  void showError(String error) {
    // TODO: implement showError
  }
}
