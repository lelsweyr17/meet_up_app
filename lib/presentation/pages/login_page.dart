import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_bloc.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_state.dart';
import 'package:meet_up_app/domain/reusable/auth_reusable.dart';
import 'package:meet_up_app/l10n/app_localizations_export.dart';
import 'package:meet_up_app/presentation/components/buttons/linear_gradient_button.dart';
import 'package:meet_up_app/presentation/components/loading_indicator.dart';
import 'package:meet_up_app/presentation/components/login_text_field.dart';
import 'package:meet_up_app/utils/people_images.dart';

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
  late final FocusNode _focusNode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _localizations = AppLocalizations.of(context)!;
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _authBloc,
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: (PeopleImages.person1..size = 140).build(),
                ),
                const SizedBox(height: 50),
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
                const SizedBox(height: 20),
                if (state is LoadingAuthentication)
                  const SizedBox(
                    height: 48,
                    child: LoadingIndicator(),
                  )
                else
                  LinearGradientButton(
                    text: _localizations.logIn,
                    onPressed: () => onLogInPressed(
                      authBloc: _authBloc,
                      context: context,
                    ),
                  ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => onSkipPressed(context),
                  child: Text(
                    _localizations.skip,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.3),
                    ),
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
