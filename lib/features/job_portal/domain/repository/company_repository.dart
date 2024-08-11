import '../../data/model/company_model.dart';
import '../../data/source/remote.dart';

abstract interface class CompanyRepository {
  Future<List<CompanyModel>> getCompanies(
      {required JobPortalRemoteSource source});
}
