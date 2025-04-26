import 'package:get_it/get_it.dart';
import 'package:auth/data/datasources/auth_remote_data_source.dart';
import 'package:auth/data/repositories/auth_repository_impl.dart';
import 'package:auth/domain/usecases/get_current_user_usecase.dart';
import 'package:auth/domain/usecases/sign_in_usecase.dart';
import 'package:auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:auth/domain/usecases/sign_out_usecase.dart';
import 'package:auth/domain/usecases/sign_up_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Firebase services
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());

  // DataSource
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt<FirebaseAuth>(), getIt<GoogleSignIn>()),
  );

  // Repository
  getIt.registerLazySingleton(() => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()));

  // Usecases
  getIt.registerLazySingleton(() => SignInUseCaseImpl(getIt<AuthRepositoryImpl>()));
  getIt.registerLazySingleton(() => SignUpUseCaseImpl(getIt<AuthRepositoryImpl>()));
  getIt.registerLazySingleton(() => SignOutUseCaseImpl(getIt<AuthRepositoryImpl>()));
  getIt.registerLazySingleton(() => GetCurrentUserUseCaseimpl(getIt<AuthRepositoryImpl>()));
  getIt.registerLazySingleton(() => SignInWithGoogleUseCaseImpl(getIt<AuthRepositoryImpl>()));
}
