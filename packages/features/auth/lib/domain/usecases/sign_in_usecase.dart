import 'package:auth/domain/repository/auth_repository.dart';
import 'package:core/common/entities/user.dart';

abstract class SignInUseCase {
  Future<UserEntity> execute(String email, String password);
}

class SignInUseCaseImpl implements SignInUseCase {
  final AuthRepository repository;

  SignInUseCaseImpl(this.repository);

  @override
  Future<UserEntity> execute(String email, String password) {
    return repository.signIn(email, password);
  }
}
