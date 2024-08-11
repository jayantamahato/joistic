import 'package:dio/dio.dart';

import '../../../../core/dio/dio.dart';
import '../../../../core/logger/logger.dart';
import '../model/company_model.dart';

abstract interface class JobPortalRemoteSource {
  Future<List<CompanyModel>> getCompanies();
}

class JobPortalRemoteSourceImpl implements JobPortalRemoteSource {
  final Api _api = Api();

  @override
  Future<List<CompanyModel>> getCompanies() async {
    try {
      Response res = await _api.makeRequest.get('/albums/1/photos');

      List<CompanyModel> companies = [];
      List<CompanyModel> mappedCompanies = (res.data as List).map((item) {
        return CompanyModel.fromJson(item as Map<String, dynamic>);
      }).toList();

      companies.addAll(mappedCompanies);

      return companies;
    } catch (e) {
      AppLog.error(message: e);
      rethrow;
    }
  }
}
