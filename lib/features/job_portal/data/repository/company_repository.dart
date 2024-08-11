import 'package:joistic/core/connection/connection.dart';
import 'package:joistic/features/error/presentation/screens/no_internet/no_internet.dart';

import '../../../../core/error/no_internet.dart';
import '../../domain/repository/company_repository.dart';
import '../model/company_model.dart';
import '../source/remote.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  @override
  Future<List<CompanyModel>> getCompanies(
      {required JobPortalRemoteSource source}) async {
    try {
      if (await hasConnection()) {
        List<CompanyModel> companies = await source.getCompanies();
        return companies;
      }
      throw DisConnected();
    } catch (e) {
      rethrow;
    }
  }
}
