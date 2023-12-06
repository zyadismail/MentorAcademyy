part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoadingLogin extends LoginState{}

class LoginDone extends LoginState{
  final UserModel userModel;
  LoginDone(this.userModel);
}
class LoginError extends LoginState{}
class ChooseImage extends LoginState{}
