import '../data/dto/api_error_response.dart';
import '../errors/app_error.dart';

class ApiErrorUtils {
  ApiErrorUtils._();

  static AppError mapApiErrorResponseToAppError(ApiErrorResponse error) {
    return AppError(error: error.error, message: error.message);
  }
}
