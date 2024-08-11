import 'package:get/get.dart';

import '../../features/auth/presentation/screens/sign_in.dart';
import '../../features/error/presentation/screens/error/error.dart';
import '../../features/error/presentation/screens/no_internet/no_internet.dart';
import '../../features/job_portal/presentation/screens/company_list.dart';
import '../../features/on_boarding/presentation/screens/on_boarding.dart';
import '../../features/searching/presentation/screens/search_screen.dart';

class AppRoute {
  static List<GetPage> routes() {
    return [
      GetPage(name: OnBoarding.route, page: () => const OnBoarding()),
      GetPage(name: SignIn.route, page: () => SignIn()),
      GetPage(name: CompanyList.route, page: () => const CompanyList()),
      GetPage(name: SearchScreen.route, page: () => SearchScreen()),
      GetPage(name: NoInternet.route, page: () => const NoInternet()),
      GetPage(name: ErrorScreen.route, page: () => const ErrorScreen()),
    ];
  }
}
