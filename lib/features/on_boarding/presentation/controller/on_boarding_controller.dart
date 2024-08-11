import 'package:get/get.dart';

import '../../../../core/error/error.dart';
import '../../data/model/credential_model.dart';
import '../../data/repository/on_boarding_repository.dart';
import '../../domain/use_case/on_boarding_use_case.dart';

class OnBoardingController extends GetxController {
  RxBool isLoading = false.obs;
  final OnBoardingRepositoryImpl _repository = OnBoardingRepositoryImpl();
  Future<CredentialModel?> checkAuthentication() async {
    try {
      isLoading(true);
      var res =
          await OnBoardingUseCase.checkAuthentication(repository: _repository);
      return res;
    } catch (e) {
      AppError(message: e);
    } finally {
      isLoading(false);
    }
  }
}
