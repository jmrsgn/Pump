import 'api_error_response.dart';

class Result<T> {
  final T? data;
  final ApiErrorResponse? error;

  bool get isSuccess => data != null && error == null;
  bool get isFailure => error != null;

  // Success constructor
  Result.success(T this.data) : error = null;

  // Failure constructor
  Result.failure(ApiErrorResponse this.error) : data = null;
}
