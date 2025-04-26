import 'package:auth/auth_module.dart';
import 'package:go_router/go_router.dart';
import 'package:localization/presentation/pages/language_selection_page.dart';
import 'package:splash/splash_module.dart';
import 'package:home/home_module.dart';
import 'package:localization/localization_module.dart';


final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    ...SplashModule.routes,
    ...AuthModule.routes,
    ...HomeModule.routes,
    ...LocalizationModule.routes
  ],
);
