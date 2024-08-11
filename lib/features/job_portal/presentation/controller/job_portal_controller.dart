import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:joistic/core/error/error.dart';

import '../../../../core/logger/logger.dart';
import '../../data/model/company_model.dart';
import '../../data/repository/company_repository.dart';
import '../../data/source/remote.dart';
import '../../domain/repository/company_repository.dart';
import '../../domain/use_case/job_portal_usecase.dart';

class JobPortalController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<CompanyModel> companyList = <CompanyModel>[].obs;
  RxList<CompanyModel> searchList = <CompanyModel>[].obs;
  RxList<int> appliedList = <int>[].obs;
  final CompanyRepository _companyRepository = CompanyRepositoryImpl();
  final JobPortalRemoteSource _jobPortalRemoteSource =
      JobPortalRemoteSourceImpl();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

//get all company

  Future getCompanies() async {
    try {
      isLoading(true);

      List<CompanyModel> companies = await JobPortalUseCase.getCompanies(
          repository: _companyRepository, source: _jobPortalRemoteSource);
      companyList.assignAll(companies);
      searchList.assignAll(companies);
    } catch (e) {
      AppError(message: e);
    } finally {
      isLoading(false);
    }
  }

//search

  void searchCompany({required String key}) {
    try {
      isLoading(true);
      searchList.clear();

      for (var element in companyList) {
        if (element.title!.toLowerCase().contains(key.toLowerCase())) {
          searchList.add(element);
        }
      }
      AppLog.debug(message: searchList.length);
    } catch (e) {
      AppError(message: e);
    } finally {
      isLoading(false);
    }
  }

//apply

  Future apply({required int index, required String uid}) async {
    try {
      appliedList.contains(index) ? null : appliedList.add(index);
      Map<String, dynamic> data = {'uid': uid, 'appliedList': appliedList};
      AppLog.warn(message: data);

      await firestore.collection('applications').doc(uid).set(data);
    } catch (e) {
      AppError(message: e);
    }
  }

//get applied list

  Future getApplied({required String uid}) async {
    try {
      isLoading(true);
      var docSnapshot =
          await firestore.collection('applications').doc(uid).get();
      if (docSnapshot.exists) {
        var data = docSnapshot.data() as Map<String, dynamic>;
        appliedList.value =
            List<int>.from(data['appliedList'] as List<dynamic>);
      } else {
        AppLog.error(message: 'No-Docs');
      }
    } catch (e) {
      AppError(message: e);
    } finally {
      isLoading(false);
    }
  }
}
