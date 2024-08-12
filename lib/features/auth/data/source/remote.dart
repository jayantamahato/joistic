import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:joistic/core/logger/logger.dart';

import '../../../../core/local_storage/local_storage.dart';
import '../../../on_boarding/data/model/credential_model.dart';
import '../model/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signInWithCredential(
      {required CredentialModel credentials});
  Future<UserModel> signInWithGoogle();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<UserModel> signInWithCredential(
      {required CredentialModel credentials}) async {
    try {
      final credential = GoogleAuthProvider.credential(
        accessToken: credentials.accessToken,
        idToken: credentials.token,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      return UserModel(
        uid: userCredential.user?.uid,
        displayName: userCredential.user?.displayName,
        email: userCredential.user?.email,
        photoURL: userCredential.user?.photoURL,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        LocalStorage.setToken(token: credential.idToken ?? '');
        LocalStorage.setAccessToken(accessToken: credential.accessToken ?? '');
        return UserModel(
          uid: userCredential.user?.uid,
          displayName: userCredential.user?.displayName,
          email: userCredential.user?.email,
          photoURL: userCredential.user?.photoURL,
        );
      }
      throw 'No-user found';
    } catch (e) {
      AppLog.warn(message: '******************');
      AppLog.error(message: e);

      rethrow;
    }
  }
}
