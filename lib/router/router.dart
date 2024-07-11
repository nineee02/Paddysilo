import 'package:auto_route/auto_route.dart';
import "package:paddy_app/router/router.gr.dart";

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
            path: '/login',
            page: LoginRoute.page,
            initial: true,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            path: '/sign_up',
            page: SignUpRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            path: '/home',
            page: HomeRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            path: '/forgot',
            page: ForgotRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            path: '/notification',
            page: ForgotRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            path: '/adddevice',
            page: AddDeviceRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            path: '/addscan',
            page: AddScanRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            path: '/otp',
            page: OTPRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            path: '/wifi',
            page: WiFiRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            path: '/profile',
            page: ProfileRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            path: '/account',
            page: AccountRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            path: '/setting_notification',
            page: Setting_NotificationRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            path: '/dnm',
            page: DNMRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn),
      ];
}
