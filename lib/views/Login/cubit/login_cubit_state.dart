import 'package:equatable/equatable.dart';

// Buraya sadece state yazıyoruz
class LoginState extends Equatable {
  final bool isLoading;

  final bool isCompleted;

  const LoginState({this.isLoading = false, this.isCompleted = false});

  @override
  List<Object?> get props => [isLoading]; // isLoading değişmedikçe sayfayı tetikleme diyoruz

  LoginState copyWith({
    bool? isLoading,
    bool? isCompleted,
  }) {
    return LoginState(
      isLoading: isLoading ?? false,
      isCompleted: isCompleted ?? false,
    );
  }
}
