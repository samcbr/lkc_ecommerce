class ResponseLKC {
  String status;
  String message;
  Map<String, dynamic> data;

  ResponseLKC({this.data, this.message, this.status});

  factory ResponseLKC.fromJson(Map<String, dynamic> json) {
    return ResponseLKC(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }
}
