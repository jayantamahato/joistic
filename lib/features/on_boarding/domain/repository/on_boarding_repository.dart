import '../../data/model/credential_model.dart';

abstract interface class OnBoardingRepository {
  Future<CredentialModel?> checkAuth();
}
