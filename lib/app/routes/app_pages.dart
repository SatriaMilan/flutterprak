import 'package:get/get.dart';

import '../modules/detail_page/bindings/detail_page_binding.dart';
import '../modules/detail_page/views/detail_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/resep/bindings/resep_binding.dart';
import '../modules/resep/views/resep_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.RESEP,
      page: () => const RecipeView(),
      binding: ResepBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PAGE,
      page: () => const DetailPageBooking(),
      binding: DetailPageBinding(),
    ),
  ];
}
