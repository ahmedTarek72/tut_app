import 'dart:async';

import 'package:tut_app/presentation/base/base_view_model.dart';

class LoginViewModel
    implements BaseViewModel, LoginViewModelInput, LoginViewModelOutput {
  final StreamController _userNameController = StreamController<String>();
  final StreamController _passwordController = StreamController<String>();
  @override
  void dispose() {
    _passwordController.close();
    _userNameController.close();
  }

  @override
  void start() {}

  @override
  // TODO: implement isPasswordValid
  Stream<bool> get isPasswordValid => throw UnimplementedError();

  @override
  // TODO: implement isUserNameValid
  Stream<bool> get isUserNameValid => throw UnimplementedError();

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  // TODO: implement password
  Sink get password => throw UnimplementedError();

  @override
  setPassword(String password) {
    // TODO: implement setPassword
    throw UnimplementedError();
  }

  @override
  setUserName(String userName) {
    // TODO: implement setUserName
    throw UnimplementedError();
  }

  @override
  // TODO: implement userName
  Sink get userName => throw UnimplementedError();
}

abstract class LoginViewModelInput {
  setUserName(String userName);
  setPassword(String password);
  login();
  Sink get userName;
  Sink get password;
}

abstract class LoginViewModelOutput {
  Stream<bool> get isUserNameValid;
  Stream<bool> get isPasswordValid;
}
