import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_bloc.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_state.dart';
import 'package:meet_up_app/domain/reusable/auth_reusable.dart';
import 'package:meet_up_app/l10n/app_localizations_export.dart';
import 'package:meet_up_app/presentation/components/button.dart';
import 'package:meet_up_app/presentation/components/loading_indicator.dart';
import 'package:meet_up_app/presentation/components/login_text_field.dart';

const _tag = "login_page";

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      builder: (BuildContext context, state) {
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
                    onPressed: () => onLogInPressed(
                      authBloc: _authBloc,
                      context: context,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
