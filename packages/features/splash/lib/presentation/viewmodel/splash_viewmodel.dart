import 'package:auth/domain/usecases/get_current_user_usecase.dart';
import 'package:core/common/entities/user.dart';
import 'package:flutter/foundation.dart';

class SplashViewmodel extends ChangeNotifier {
  final GetCurrentUserUseCase getCurrentUserUseCase;

  SplashViewmodel({required this.getCurrentUserUseCase});

  Future<bool> checkLoginStatus() async {
    UserEntity? user = getCurrentUserUseCase.execute();
    return user != null;
  }
}
