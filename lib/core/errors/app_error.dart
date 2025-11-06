class AppError {
  final String error;
  final String message;
  final StackTrace? stackTrace;

  AppError({required this.error, required this.message, this.stackTrace});

  @override
  String toString() => 'AppError(error: $error, message: $message)';
}
