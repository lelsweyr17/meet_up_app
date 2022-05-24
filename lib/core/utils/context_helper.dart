import 'package:flutter/cupertino.dart';
import 'package:meet_up_app/core/l10n/app_localizations_export.dart';

extension ContextHelper on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}
