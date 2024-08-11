import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:joistic/core/error/error.dart';

import '../../../../core/local_storage/local_storage.dart';
import '../../../../core/logger/logger.dart';
import '../../../on_boarding/data/model/credential_model.dart';
import '../../data/model/user_model.dart';
import '../../data/repository/auth_repository.dart';
import '../../data/source/remote.dart';
import '../../domain/repository/auth_repository.dart';
import '../../domain/use_case/auth_usecase.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<UserModel> user = UserModel().obs;
  final AuthRepository _authRepository = AuthRepositoryImpl();
  final AuthRemoteDataSource _dataSource = AuthRemoteDataSourceImpl();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future signInWithGoogle() async {
    try {
      isLoading(true);

      UserModel? gUser = await AuthUseCase.signInWithGoogle(
          repository: _authRepository, source: _dataSource);
      if (gUser != null) {
        user.value = gUser;
      }
      throw AppError(message: 'No user');
    } catch (e) {
      AppLog.error(message: e);
    } finally {
      isLoading(false);
    }
  }

  Future signInWithCredentials({required CredentialModel credentials}) async {
    try {
      UserModel? gUser = await AuthUseCase.signInWithCredential(
          credentials: credentials,
          repository: _authRepository,
          source: _dataSource);
      if (gUser != null) {
        user.value = gUser;
      }
      throw AppError(message: 'No user');
    } catch (e) {
      AppLog.error(message: e);
    }
  }

  Future signOut() async {
    await _auth.signOut();
    await LocalStorage.clear();
  }
}
