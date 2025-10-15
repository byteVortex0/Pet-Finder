import 'error_model.dart';

sealed class ApiResult<T> {
  const ApiResult();
}

class Success<T> extends ApiResult<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends ApiResult<T> {
  final ErrorModel errorModel;
  const Failure(this.errorModel);
}
