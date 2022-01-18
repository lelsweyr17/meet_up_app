import 'package:flutter/material.dart';
import 'package:meet_up_app/l10n/app_localizations_export.dart';
import 'package:meet_up_app/utils/app_icons.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xfff5f5f5),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
            border: InputBorder.none,
            hintText: AppLocalizations.of(context)!.search,
            hintStyle: const TextStyle(color: Color(0xFFB3B3B3)),
            suffixIcon: Padding(
              padding: const EdgeInsetsDirectional.only(end: 6.0),
              child: IconButton(
                icon:
                    (AppIcons.search..color = const Color(0xFFB3B3B3)).build(),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
