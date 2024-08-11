import '../../../../core/connection/connection.dart';
import '../../../../core/error/error.dart';
import '../../../../core/error/no_internet.dart';
import '../../../../core/local_storage/local_storage.dart';
import '../../domain/repository/on_boarding_repository.dart';
import '../model/credential_model.dart';

class OnBoardingRepositoryImpl implements OnBoardingRepository {
  @override
  Future<CredentialModel?> checkAuth() async {
    try {
      if (await hasConnection()) {
        String token = await LocalStorage.getToken();
        String accessToken = await LocalStorage.getAccessToken();
        if (token == '') return null;
        return CredentialModel(accessToken: accessToken, token: token);
      }

      DisConnected();
      return null;
    } catch (e) {
      throw AppError(message: e);
    }
  }
}
