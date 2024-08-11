import '../../../on_boarding/data/model/credential_model.dart';
import '../../data/model/user_model.dart';
import '../../data/source/remote.dart';
import '../repository/auth_repository.dart';

class AuthUseCase {
  static Future<UserModel?> signInWithGoogle(
      {required AuthRepository repository,
      required AuthRemoteDataSource source}) async {
    try {
      UserModel? user = await repository.signInWithGoogle(source: source);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  static Future<UserModel?> signInWithCredential(
      {required AuthRepository repository,
      required CredentialModel credentials,
      required AuthRemoteDataSource source}) async {
    try {
      UserModel? user = await repository.signInWithCredential(
          credentials: credentials, source: source);
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
