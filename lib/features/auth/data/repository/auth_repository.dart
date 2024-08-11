import 'package:joistic/features/error/presentation/screens/no_internet/no_internet.dart';

import '../../../../core/connection/connection.dart';
import '../../../../core/error/error.dart';
import '../../../../core/error/no_internet.dart';
import '../../../../core/local_storage/local_storage.dart';
import '../../../on_boarding/data/model/credential_model.dart';
import '../../domain/repository/auth_repository.dart';
import '../model/user_model.dart';
import '../source/remote.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<UserModel> signInWithCredential(
      {required CredentialModel credentials,
      required AuthRemoteDataSource source}) async {
    try {
      if (await hasConnection()) {
        UserModel user =
            await source.signInWithCredential(credentials: credentials);
        return user;
      }
      throw DisConnected();
    } catch (e) {
      await LocalStorage.clear();
      throw AppError(message: e);
    }
  }

  @override
  Future<UserModel> signInWithGoogle(
      {required AuthRemoteDataSource source}) async {
    try {
      if (await hasConnection()) {
        UserModel user = await source.signInWithGoogle();
        return user;
      }
      throw DisConnected();
    } catch (e) {
      rethrow;
    }
  }
}
