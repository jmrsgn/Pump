import 'package:equatable/equatable.dart';
import 'package:pump/features/auth/domain/entities/user.dart';

class UserState extends Equatable {
  final User user;

  const UserState({required this.user});

  @override
  List<Object?> get props => [user];
}
