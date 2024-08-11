import '../../../../core/logger/logger.dart';
import '../../data/model/credential_model.dart';
import '../repository/on_boarding_repository.dart';

class OnBoardingUseCase {
  static Future<CredentialModel?> checkAuthentication(
      {required OnBoardingRepository repository}) async {
    try {
      CredentialModel? res = await repository.checkAuth();
      return res;
    } catch (e) {
      AppLog.error(message: e);
      rethrow;
    }
  }
}
