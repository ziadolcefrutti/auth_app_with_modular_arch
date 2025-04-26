import 'package:core/provider/langauges_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization/presentation/widgets/langauge_selection_tile.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class LanguageSelectPage extends StatelessWidget {
  const LanguageSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguagesProvider>(context);
    final currentLocale = languageProvider.currentLocale;

    final supportedLanguages = [
      {'name': 'English 🇺🇸', 'locale': const Locale('en')},
      {'name': 'Español 🇪🇸', 'locale': const Locale('es')},
      {'name': 'اردو 🇵🇰', 'locale': const Locale('ur')},
      {'name': 'Deutsch 🇩🇪', 'locale': const Locale('de')},
      {'name': 'Français 🇫🇷', 'locale': const Locale('fr')},
      {'name': 'العربية 🇸🇦', 'locale': const Locale('ar')},
      {'name': 'Türkçe 🇹🇷', 'locale': const Locale('tr')},
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        title: Text(AppLocalizations.of(context)?.selectLangauge ?? ''),
      ),
      body: ListView(
        children:
            supportedLanguages.map((lang) {
              return LanguageSelectionTile(
                languageName: lang['name'] as String,
                locale: lang['locale'] as Locale,
                currentLocale: currentLocale,
                onLanguageSelected: languageProvider.setLocale,
              );
            }).toList(),
      ),
    );
  }
}
