import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final bool isCompleted;

  const LoginState({this.isLoading = false, this.isCompleted = false});

  @override
  // sadece isLoading değiştiği zaman çağır
  List<Object?> get props => [
        isLoading,
      ];

  LoginState copyWith({
    bool? isLoading,
    bool? isCompleted,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
