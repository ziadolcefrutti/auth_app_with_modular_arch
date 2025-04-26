import 'package:auth_app_modular/app/app_router.dart';
import 'package:auth_app_modular/app/app_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:core/provider/langauges_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:splash/splash_module.dart';
import 'package:auth/auth_module.dart';
import 'firebase_options.dart';
import 'app/service_locator.dart'; // <<<<< Add this

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ...SplashModule.getProviders(getIt),
        ...AuthModule.getProviders(getIt),
        ChangeNotifierProvider(create: (_) => LanguagesProvider()),
      ],
      child: Consumer<LanguagesProvider>(
        builder: (context, value, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Auth App',
            theme: lightTheme,
            localizationsDelegates: [
              ...AppLocalizations.localizationsDelegates,
              ...GlobalMaterialLocalizations.delegates,
            ],
            locale: value.currentLocale,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
