import 'package:pump/core/presentation/providers/ui_state.dart';

class CreatePostState extends UiState {
  const CreatePostState({super.isLoading, super.errorMessage});

  @override
  CreatePostState copyWith({bool? isLoading, String? errorMessage}) {
    return CreatePostState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory CreatePostState.initial() {
    return const CreatePostState(isLoading: false, errorMessage: null);
  }
}
