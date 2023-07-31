import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/post_details/bindings/post_details_binding.dart';
import '../modules/post_details/views/post_details_view.dart';

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
      name: _Paths.POST_DETAILS,
      page: () => const PostDetailsView(),
      binding: PostDetailsBinding(),
    ),
  ];
}
