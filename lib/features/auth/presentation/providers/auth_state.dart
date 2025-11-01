import 'package:equatable/equatable.dart';
import 'package:pump/features/auth/data/models/auth_response_dto.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final AuthResponse? authResponse;

  const AuthState({
    this.isLoading = false,
    this.errorMessage,
    this.authResponse,
  });

  AuthState copyWith({
    bool? isLoading,
    String? errorMessage,
    AuthResponse? authResponse,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      authResponse: authResponse ?? this.authResponse,
    );
  }

  factory AuthState.initial() => const AuthState();

  @override
  List<Object?> get props => [isLoading, errorMessage, authResponse];
}
