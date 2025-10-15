import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  final int? statusCode;
  final String? message;
  final Map<String, List<String>>? errors;

  const ErrorModel({this.statusCode, this.message, this.errors});

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);

  String get displayMessage {
    if (errors != null && errors!.isNotEmpty) {
      final buffer = StringBuffer();

      errors!.forEach((field, messages) {
        if (messages.length > 1) {
          buffer.writeln("$field:");
          for (final msg in messages) {
            buffer.writeln("  • $msg");
          }
        } else {
          buffer.writeln("$field: ${messages.first}");
        }
        buffer.writeln(); 
      });

      return buffer.toString().trim();
    }

    return message ?? "Unknown error occurred";
  }

  @override
  String toString() =>
      'ErrorModel(statusCode: $statusCode, message: $message, errors: $errors)';
}
