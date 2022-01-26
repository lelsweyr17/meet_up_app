import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:meet_up_app/data/model/client/user.dart';
import 'package:meet_up_app/data/repository/user_repository.dart';
import 'package:meet_up_app/data/service/auth_service.dart';
import 'package:meet_up_app/domain/bloc/auth/auth_bloc.dart';
import 'package:meet_up_app/domain/bloc/profile/profile_bloc.dart';
import 'package:meet_up_app/domain/reusable/auth_reusable.dart';
import 'package:meet_up_app/l10n/app_localizations_export.dart';
import 'package:meet_up_app/presentation/components/app_bars.dart';
import 'package:meet_up_app/presentation/components/avatar.dart';
import 'package:meet_up_app/presentation/components/logIn_and_sign_up_buttons_page.dart';
import 'package:meet_up_app/presentation/components/rating.dart';
import 'package:meet_up_app/utils/app_icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        body: AuthService.instance.isUserAnonymousOrNull
            ? const LogInAndSignUpButtonsPage()
            : const _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        _AppBarWithAvatarAndRating(),
        _ProfileDescription(),
        _ProfileSettings(),
      ],
    );
  }
}

class _AppBarWithAvatarAndRating extends StatelessWidget {
  const _AppBarWithAvatarAndRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBars.instance.sliverAppBarWithGradient(
      size: 120,
      title: AppLocalizations.of(context)!.profile,
      child: const _AvatarAndRating(),
    );
  }
}

class _AvatarAndRating extends StatelessWidget {
  const _AvatarAndRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(0, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Avatar(size: 120),
              Rating(),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProfileDescription extends StatelessWidget {
  const _ProfileDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final ProfileBloc profileBloc = ProfileBloc();

    return StreamBuilder(
      stream: UserRepository.instance.stream,
      builder: (context, snapshot) {
        if (snapshot.data == null) return const SliverToBoxAdapter();

        final user = snapshot.data as User;

        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            child: BlocBuilder(
              bloc: profileBloc,
              builder: (context, _) {
                return Column(
                  children: [
                    TextFieldWithHelperAndLimit(
                      focusNode: FocusNode(),
                      initialTitle: user.name,
                      subtitle: localizations.name,
                      hint: localizations.name,
                      onChanged: (value) => profileBloc.add(UpdateName(value)),
                    ),
                    const Divider(),
                    TextFieldWithHelperAndLimit(
                      focusNode: FocusNode(),
                      initialTitle: user.bio,
                      subtitle: localizations.bio,
                      hint: localizations.bio,
                      limitLength: 120,
                      onChanged: (value) => profileBloc.add(UpdateBio(value)),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class TextFieldWithHelperAndLimit extends StatefulWidget {
  const TextFieldWithHelperAndLimit({
    Key? key,
    required this.focusNode,
    required this.hint,
    this.initialTitle,
    this.subtitle = "",
    this.onChanged,
    this.limitLength = 100,
  }) : super(key: key);

  final ValueChanged<String>? onChanged;
  final String? initialTitle;
  final String hint;
  final String subtitle;
  final int limitLength;
  final FocusNode focusNode;

  @override
  State<TextFieldWithHelperAndLimit> createState() =>
      TextFieldWithHelperAndLimitState();
}

class TextFieldWithHelperAndLimitState
    extends State<TextFieldWithHelperAndLimit> {
  bool inFocus = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(
      () => setState(() => inFocus = widget.focusNode.hasFocus),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: TextFormField(
        scrollPadding: EdgeInsets.zero,
        focusNode: widget.focusNode,
        keyboardType: TextInputType.name,
        initialValue: widget.initialTitle,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 4),
          border: InputBorder.none,
          hintText: widget.hint,
          hintStyle: const TextStyle(color: Color(0xFFB3B3B3), fontSize: 14),
          helperText: widget.subtitle,
          helperStyle: const TextStyle(
            fontSize: 12,
            color: Color(0xff808080),
          ),
        ),
        minLines: 1,
        maxLines: null,
        style: const TextStyle(
          color: Color(0xFF1A1A1A),
          fontSize: 16,
        ),
        maxLength: inFocus ? widget.limitLength : null,
        onChanged: (value) => widget.onChanged!(value),
      ),
    );
  }
}

class RoundedBorderContainerWithChild extends StatelessWidget {
  const RoundedBorderContainerWithChild({
    Key? key,
    required this.child,
    this.onPressed,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}

class LeadingAndTitle extends StatelessWidget {
  const LeadingAndTitle({
    Key? key,
    required this.leading,
    required this.title,
    this.titleColor = Colors.black,
  }) : super(key: key);

  final Widget leading;
  final String title;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 0,
      leading: leading,
      title: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: titleColor,
          fontSize: 16,
          fontWeight: FontWeight.normal,
          letterSpacing: -0.33,
        ),
      ),
    );
  }
}

class _ProfileSettings extends StatelessWidget {
  const _ProfileSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Container(
        color: const Color(0xfff5f5f5),
        child: Column(
          children: [
            const SizedBox(height: 20),
            RoundedBorderContainerWithChild(
              onPressed: () {},
              child: LeadingAndTitle(
                title: AppLocalizations.of(context)!.changeProfilePhoto,
                titleColor: Colors.orange,
                leading: (AppIcons.addPhoto..color = Colors.orange).build(),
              ),
            ),
            const SizedBox(height: 20),
            RoundedBorderContainerWithChild(
              onPressed: () {},
              child: Column(
                children: [
                  LeadingAndTitle(
                    title: AppLocalizations.of(context)!.myMeetings,
                    leading: (AppIcons.calendar).build(),
                  ),
                  const Divider(height: 0),
                  LeadingAndTitle(
                    title: AppLocalizations.of(context)!.settings,
                    leading: (AppIcons.settings).build(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            RoundedBorderContainerWithChild(
              onPressed: () => onLogOutPressed(
                context: context,
                authBloc: AuthBloc(),
              ),
              child: LeadingAndTitle(
                title: AppLocalizations.of(context)!.logOut,
                leading: AppIcons.logOut.build(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
