class ErrorModel {
  final String message;

  const ErrorModel({required this.message});

  factory ErrorModel.fromJson(dynamic response) {
    if (response is String && response.trim().isNotEmpty) {
      return ErrorModel(message: response.trim());
    }
    return const ErrorModel(message: "An unknown error occurred");
  }

  String get displayMessage => message;

  @override
  String toString() => 'ErrorModel(message: $message)';
}
