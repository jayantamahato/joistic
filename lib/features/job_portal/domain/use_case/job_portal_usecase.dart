import '../../data/model/company_model.dart';
import '../../data/source/remote.dart';
import '../repository/company_repository.dart';

class JobPortalUseCase {
  static Future<List<CompanyModel>> getCompanies(
      {required CompanyRepository repository,
      required JobPortalRemoteSource source}) async {
    try {
      List<CompanyModel> company =
          await repository.getCompanies(source: source);
      return company;
    } catch (e) {
      rethrow;
    }
  }
}
