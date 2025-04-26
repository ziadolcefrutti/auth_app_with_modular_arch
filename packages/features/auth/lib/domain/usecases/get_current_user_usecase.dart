import 'package:auth/domain/repository/auth_repository.dart';
import 'package:core/common/entities/user.dart';

abstract class GetCurrentUserUseCase {
  UserEntity? execute();
}

class GetCurrentUserUseCaseimpl implements GetCurrentUserUseCase {
  final AuthRepository repository;

  GetCurrentUserUseCaseimpl(this.repository);

  @override
  UserEntity? execute() {
    return repository.getCurrentUser();
  }
}
