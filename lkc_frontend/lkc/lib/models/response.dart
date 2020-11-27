import 'dart:convert';

class ResponseLKC {
  String status;
  String message;
  dynamic data;

  ResponseLKC({this.data, this.message, this.status});

 

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'data': data,
    };
  }

  factory ResponseLKC.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ResponseLKC(
      status: map['status'],
      message: map['message'],
      data: map['data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseLKC.fromJson(String source) => ResponseLKC.fromMap(json.decode(source));
}
