import 'package:flutter/material.dart';
import 'package:palestra_introducao/repository/Repository.dart';
import 'package:palestra_introducao/repository/model/ShoesRequest.dart';

class UpdateShoesWidget extends StatefulWidget {
  dynamic data;

  UpdateShoesWidget(this.data);

  @override
  _UpdateShoesWidgetState createState() => _UpdateShoesWidgetState();
}

class _UpdateShoesWidgetState extends State<UpdateShoesWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _title = TextEditingController();
  TextEditingController _slug = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _image = TextEditingController();

  @override
  void initState() {
    super.initState();
    _title.text = widget.data['title'];
    _slug.text = widget.data['slug'];
    _description.text = widget.data['description'];
    _price.text = widget.data['price'].toString();
    _image.text = widget.data['image_url'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atualizar'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Atualizar tênis',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  _buildTextFormField(
                      _title,
                      'Titutlo',
                      (val) =>
                          val.isEmpty ? 'Por favor digitar o titulo' : null,
                      TextInputType.text),
                  SizedBox(
                    height: 20,
                  ),
                  _buildTextFormField(
                      _slug,
                      'Slug',
                      (val) => val.isEmpty ? 'Por favor digitar o slug' : null,
                      TextInputType.text),
                  SizedBox(
                    height: 20,
                  ),
                  _buildTextFormField(
                      _description,
                      'Descrição',
                      (val) =>
                          val.isEmpty ? 'Por favor digitar a Descrição' : null,
                      TextInputType.text),
                  SizedBox(
                    height: 20,
                  ),
                  _buildTextFormField(
                      _price,
                      'Preço',
                      (val) => val.isEmpty ? 'Por favor digitar o preço' : null,
                      TextInputType.number),
                  SizedBox(
                    height: 20,
                  ),
                  _buildTextFormField(
                      _image,
                      'Url',
                      (val) => val.isEmpty ? 'Por favor digitar a Url' : null,
                      TextInputType.text),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      onPressed: () {
                        if (!_formKey.currentState.validate()) return;

                        var request = ShoesRequest(
                            title: _title.text,
                            slug: _slug.text,
                            description: _description.text,
                            price: int.parse(_price.text),
                            imageUrl: _image.text);
                        var result = put(
                            '/products', request.toJson(), widget.data['_id']);
                        result.then((o) {
                          if (o == 200) {

                            final alertDialog = AlertDialog(
                              title: Text('Atualizado com sucesso!'),
                              content: Text('aqui'),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop(true);
                                  },
                                ),
                              ],
                            );

                            showDialog(context: context, builder: (_) => alertDialog);
                          }
                        });
                      },
                      child: Text('Concluir'),
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
