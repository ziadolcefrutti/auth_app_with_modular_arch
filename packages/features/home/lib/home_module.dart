import 'package:go_router/go_router.dart';
import 'package:home/presentation/pages/home_page.dart';
import 'package:provider/provider.dart';

class HomeModule {
  static List<ChangeNotifierProvider> getProviders(getIt) => [];

  static List<GoRoute> get routes => [
        GoRoute(
          path: '/home',
          name: 'home',
          builder: (context, state) => const HomePage(),
        ),
      ];
}
