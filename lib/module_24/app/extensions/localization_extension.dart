import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/l10n/app_localizations.dart';

extension LocalizationExtention on BuildContext {
  AppLocalizations get localization {
    return AppLocalizations.of(this)!;
  }
}