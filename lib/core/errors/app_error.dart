class AppError {
  final String error;
  final String message;

  AppError({required this.error, required this.message});

  @override
  String toString() => 'AppError(error: $error, message: $message)';
}
