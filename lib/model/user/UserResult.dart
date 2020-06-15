class UserResult {
  int _id;
  String _name;
  String _email;
  String _cpf;

  UserResult({int id, String name, String email, String cpf}) {
    this._id = id;
    this._name = name;
    this._email = email;
    this._cpf = cpf;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get email => _email;
  set email(String email) => _email = email;
  String get cpf => _cpf;
  set cpf(String cpf) => _cpf = cpf;

  UserResult.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _cpf = json['cpf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['email'] = this._email;
    data['cpf'] = this._cpf;
    return data;
  }
}