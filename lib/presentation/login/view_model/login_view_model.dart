import 'dart:async';

import 'package:tut_app/presentation/base/base_view_model.dart';
import 'package:tut_app/presentation/common/freezed_data_class.dart';

class LoginViewModel
    implements BaseViewModel, LoginViewModelInput, LoginViewModelOutput {
  var loginObject = const LoginObject("", "");

  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  @override
  void dispose() {
    _passwordStreamController.close();
    _userNameStreamController.close();
  }

  @override
  void start() {}

  @override
  Stream<bool> get isPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  @override
  Stream<bool> get isUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Sink get password => _passwordStreamController.sink;

  @override
  setPassword(String password) {
   loginObject= loginObject.copyWith(password: password);
  }

  @override
  setUserName(String userName) {
    loginObject= loginObject.copyWith(name: userName);
    
  }

  @override
  Sink get userName => _userNameStreamController.sink;
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
