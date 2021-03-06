class GenericResult {
  String message;

  GenericResult({this.message});

  GenericResult.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }

  @override
  String toString() {
    return 'GenericResult{message: $message}';
  }


}