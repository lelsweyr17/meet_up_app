import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet_up_app/core/utils/log.dart';
import 'package:mobx/mobx.dart';

import '../../domain/use_cases/login_use_case.dart';
import '../../domain/use_cases/sign_up_use_case.dart';

part 'authorization_logic.g.dart';

const _tag = "authorization_logic";

class AuthorizationLogic = AuthorizationLogicBase with _$AuthorizationLogic;

abstract class AuthorizationLogicBase with Store {
  AuthorizationLogicBase({
    required LoginUseCase loginUseCase,
    required SignUpUseCase signUpUseCase,
  })  : _loginUseCase = loginUseCase,
        _signUpUseCase = signUpUseCase;

  final LoginUseCase _loginUseCase;
  final SignUpUseCase _signUpUseCase;

  @observable
  String _login = "";

  @observable
  String _password = "";

  @computed
  Params get _params => Params(login: _login, password: _password);

  @action
  void updateLogin(String value) {
    _login = value;
  }

  @action
  void updatePassword(String value) {
    _password = value;
  }

  @action
  void onLoginPressed() async {
    Log.message(_tag, "onLoginPressed");
    await _loginUseCase(_params);
  }

  @action
  void onSignUpPressed() async {
    Log.message(_tag, "onSignUpPressed");
    await _signUpUseCase(_params);
  }

  @action
  void popBack(context) {
    Navigator.pop(context);
  }
}
