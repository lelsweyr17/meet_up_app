import 'package:flutter/material.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_bloc.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_event.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_state.dart';
import 'package:meet_up_app/internal/routes.dart';
import 'package:meet_up_app/services/preferences_service.dart';
import 'package:meet_up_app/utils/log.dart';

const _tag = "auth_reusable";

void onNavigateToSignUpPressed(BuildContext context) {
  Log.message(_tag, "onSignUpPressed");

  Navigator.pushNamed(context, Routes.instance.signUpPage);
}

void onNavigateLogInPressed(BuildContext context) {
  Log.message(_tag, "onLogInPressed");

  Navigator.pushNamed(context, Routes.instance.loginPage);
}

void onSkipPressed(BuildContext context) {
  Log.message(_tag, "onSkipPressed");

  Navigator.pushNamedAndRemoveUntil(
    context,
    Routes.instance.homePage,
    (route) => false,
  );

  PreferencesService.instance.setShowStartPage(false);
}

void onSignUpPressed({
  required AuthBloc authBloc,
  required BuildContext context,
}) async {
  Log.message(_tag, "onSignUpPressed");

  authBloc.add(SignUpEvent());

  authBloc.stream.listen((state) {
    if (state is Authenticated) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.instance.homePage,
        (route) => false,
      );
    }
  });
}

void onLogInPressed({
  required AuthBloc authBloc,
  required BuildContext context,
}) {
  Log.message(_tag, "onLogInPressed");

  authBloc.add(LogInEvent());

  authBloc.stream.listen((state) {
    if (state is Authenticated) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.instance.homePage,
        (route) => false,
      );
    }
  });
}

void onLogOutPressed({
  required BuildContext context,
  required AuthBloc authBloc,
}) {
  Log.message(_tag, "onLogOutPressed");

  authBloc.add(LogOutEvent());

  Navigator.pushNamedAndRemoveUntil(
    context,
    Routes.instance.startPage,
    (route) => false,
  );

  PreferencesService.instance.setShowStartPage(true);
}
