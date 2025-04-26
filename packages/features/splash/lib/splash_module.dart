// packages/splash/lib/splash_module.dart

import 'package:auth/domain/usecases/get_current_user_usecase.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:splash/presentation/pages/splash_page.dart';
import 'package:splash/presentation/viewmodel/splash_viewmodel.dart';

class SplashModule {
  static List<ChangeNotifierProvider<SplashViewmodel>> getProviders(getIt) => [
        ChangeNotifierProvider<SplashViewmodel>(
          create: (_) => SplashViewmodel(
            getCurrentUserUseCase: getIt<GetCurrentUserUseCaseimpl>(),
          ),
        ),
      ];

  static List<GoRoute> get routes => [
        GoRoute(
          path: '/splash',
          name: 'splash',
          builder: (context, state) => const SplashPage(),
        ),
      ];
}
