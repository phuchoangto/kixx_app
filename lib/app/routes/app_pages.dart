import 'package:get/get.dart';

import '../modules/checkIn/bindings/check_in_binding.dart';
import '../modules/checkIn/views/check_in_view.dart';
import '../modules/event/bindings/event_binding.dart';
import '../modules/event/views/event_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/server/bindings/server_binding.dart';
import '../modules/server/views/server_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SERVER;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.EVENT,
      page: () => const EventView(),
      binding: EventBinding(),
    ),
    GetPage(
      name: _Paths.CHECK_IN,
      page: () => const CheckInView(),
      binding: CheckInBinding(),
    ),
    GetPage(
      name: _Paths.SERVER,
      page: () => const ServerView(),
      binding: ServerBinding(),
    ),
  ];
}
