import 'package:json_annotation/json_annotation.dart';

part 'api_error.g.dart';

@JsonSerializable(createToJson: false)
class ApiError {
  List<String> errors;

  ApiError(this.errors);

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);

  String get message => errors[0].split("\n").last;

  @override
  String toString() {
    return 'ApiError{errors: $errors}';
  }
}
