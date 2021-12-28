import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_bloc.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_event.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_state.dart';
import 'package:meet_up_app/internal/routes.dart';
import 'package:meet_up_app/l10n/app_localizations_export.dart';
import 'package:meet_up_app/presentation/components/button.dart';
import 'package:meet_up_app/presentation/components/loading_indicator.dart';
import 'package:meet_up_app/presentation/components/login_text_field.dart';
import 'package:meet_up_app/utils/log.dart';

const _tag = "sign_up_page";

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final AppLocalizations _localizations;
  late final AuthBloc _authBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _localizations = AppLocalizations.of(context)!;
    _authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _authBloc,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoginTextField(
                    hintText: _localizations.enterYourEmail,
                    obscure: false,
                    onChanged: (value) => _authBloc.emailSink.add(value),
                  ),
                  const SizedBox(height: 16),
                  LoginTextField(
                    hintText: _localizations.enterYourPassword,
                    obscure: true,
                    onChanged: (value) => _authBloc.passwordSink.add(value),
                  ),
                  const SizedBox(height: 16),
                  if (state is LoadingAuthentication)
                    const LoadingIndicator()
                  else
                    Button(
                      text: _localizations.logIn,
                      onPressed: _onSignUpPressed,
                    ),
                ],
              ),
            ),
          );
        });
  }

  void _onSignUpPressed() {
    Log.message(_tag, "_onSignUpPressed");

    _authBloc.add(SignUpEvent());

    _authBloc.stream.listen((state) {
      if (state is Authenticated) {
        Navigator.pushReplacementNamed(context, Routes.instance.homePage);
      }
    });
  }
}
