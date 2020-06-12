import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palestra_introducao/model/ShoesRequest.dart';
import 'package:palestra_introducao/repository/Repository.dart';
import 'package:palestra_introducao/scenes/shoes/list_shoe.dart';

class ShoesWidget extends StatefulWidget {
  @override
  _ShoesWidgetState createState() => _ShoesWidgetState();
}

class _ShoesWidgetState extends State<ShoesWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _title = TextEditingController();
  TextEditingController _slug = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _image = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Shoe'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                _buildTextFormField(
                    _title,
                    'Titutlo',
                    (val) => val.isEmpty ? 'Por favor digitar o titulo' : null,
                    TextInputType.text),
                _buildTextFormField(
                    _slug,
                    'Slug',
                    (val) => val.isEmpty ? 'Por favor digitar o slug' : null,
                    TextInputType.text),
                _buildTextFormField(
                    _description,
                    'Descrição',
                    (val) =>
                        val.isEmpty ? 'Por favor digitar a Descrição' : null,
                    TextInputType.text),
                _buildTextFormField(
                    _price,
                    'Preço',
                    (val) => val.isEmpty ? 'Por favor digitar o preço' : null,
                    TextInputType.number),
                _buildTextFormField(
                    _image,
                    'Url',
                    (val) => val.isEmpty ? 'Por favor digitar a Url' : null,
                    TextInputType.text),
                RaisedButton(
                  child: Text('Send'),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) return;

                    var request = ShoesRequest(
                        title: _title.text,
                        slug: _slug.text,
                        description: _description.text,
                        price: int.parse(_price.text),
                        imageUrl: _image.text);
                    var map = post('/products', request.toJson());
                    print(map.then((o) {
                      if (o == 201 || o == "201") {
                        _title.text = '';
                        _description.text = '';
                        _slug.text = '';
                        _price.text = '';
                        _image.text = '';

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListShoesWidget()));
                      }
                    }));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => ListShoesWidget())),
        backgroundColor: Colors.blueAccent,
        splashColor: Colors.grey,
        child: Icon(Icons.line_style),
      ),
    );
  }

  TextFormField _buildTextFormField(TextEditingController controller,
      String title, Function validator, TextInputType type) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: title),
      keyboardType: type,
      validator: validator,
    );
  }
}
