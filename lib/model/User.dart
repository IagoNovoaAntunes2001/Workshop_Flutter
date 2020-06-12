class User {
  String _name;
  String _email;
  String _cpf;

  User({String name, String email, String cpf}) {
    this._name = name;
    this._email = email;
    this._cpf = cpf;
  }

  String get name => _name;
  set name(String name) => _name = name;
  String get email => _email;
  set email(String email) => _email = email;
  String get cpf => _cpf;
  set cpf(String cpf) => _cpf = cpf;

  User.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _email = json['email'];
    _cpf = json['cpf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['email'] = this._email;
    data['cpf'] = this._cpf;
    return data;
  }
}