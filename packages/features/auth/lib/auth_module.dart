import 'package:auth/domain/usecases/get_current_user_usecase.dart';
import 'package:auth/domain/usecases/sign_in_usecase.dart';
import 'package:auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:auth/domain/usecases/sign_out_usecase.dart';
import 'package:auth/domain/usecases/sign_up_usecase.dart';
import 'package:auth/presentation/pages/login_page.dart';
import 'package:auth/presentation/pages/signup_page.dart';
import 'package:auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AuthModule {
  static List<ChangeNotifierProvider<AuthsViewModel>> getProviders(getIt) => [
    ChangeNotifierProvider<AuthsViewModel>(
      create: (_) => _createAuthViewModel(getIt),
    ),
  ];

  static List<GoRoute> get routes => [
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/signup',
      name: 'signup',
      builder: (context, state) => const SignUpPage(),
    ),
  ];

  static AuthsViewModel _createAuthViewModel( getIt) {
    return AuthsViewModel(
      signInUseCase: getIt<SignInUseCaseImpl>(),
      signOutUseCase: getIt<SignOutUseCaseImpl>(),
      signUpUseCase: getIt<SignUpUseCaseImpl>(),
      signInWithGoogleUseCase: getIt<SignInWithGoogleUseCaseImpl>(),
      getCurrentUserUseCase: getIt<GetCurrentUserUseCaseimpl>(),
    );
  }
}
