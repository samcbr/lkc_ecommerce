import 'package:lkc/models/response.dart';

class Result {
  dynamic result;
  Result({this.result});
  factory Result.success(result) {
    return Result(result: result);
  }

  factory Result.failure(result) {
    return Result(result: result);
  }

}
