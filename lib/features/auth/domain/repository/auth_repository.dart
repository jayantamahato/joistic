import '../../../on_boarding/data/model/credential_model.dart';
import '../../data/model/user_model.dart';
import '../../data/source/remote.dart';

abstract interface class AuthRepository {
  Future<UserModel?> signInWithGoogle({required AuthRemoteDataSource source});
  Future<UserModel?> signInWithCredential(
      {required CredentialModel credentials,
      required AuthRemoteDataSource source});
}
