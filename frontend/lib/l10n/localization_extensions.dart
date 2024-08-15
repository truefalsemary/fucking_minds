import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// This simplify access to the current locale and l10n instance through context
extension LocaleBuildContextExtension on BuildContext {
  Locale get currentLocale => Localizations.localeOf(this);
  S get l10n => S.of(this)!;
}
