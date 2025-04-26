import 'package:go_router/go_router.dart';
import 'package:localization/presentation/pages/language_selection_page.dart';
import 'package:provider/provider.dart';

class LocalizationModule {
  static List<ChangeNotifierProvider> getProviders(getIt) => [];

  static List<GoRoute> get routes => [
    GoRoute(
      path: '/langauge',
      name: 'langauge',
      builder: (context, state) => const LanguageSelectPage(),
    ),
  ];
}
