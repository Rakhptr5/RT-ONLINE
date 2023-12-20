import 'package:get/get.dart';
import 'package:venturo_core/configs/routes/route.dart';
import 'package:venturo_core/features/dashboard/view/ui/dashboard_screen.dart';
import 'package:venturo_core/features/forgot_pass/view/ui/forgot_pass_screen.dart';
import 'package:venturo_core/features/new_pass/view/ui/new_pass_screen.dart';
import 'package:venturo_core/features/verif_code/view/ui/insert_code.dart';
import 'package:venturo_core/features/invitation/view/ui/invitation_screen.dart';
import 'package:venturo_core/features/sign_in/view/ui/sign_in_screen.dart';
import 'package:venturo_core/features/splash/bindings/splash_binding.dart';
import 'package:venturo_core/features/splash/view/ui/splash_screen.dart';

abstract class Pages {
  static final pages = [
    GetPage(
        name: Routes.splashRoute,
        page: () => SplashScreen(),
        binding: SplashBinding()),
    GetPage(name: Routes.signInRoute, page: () => SignInScreen()),
    GetPage(name: Routes.forgotPassRoute, page: () => ForgotView()),
    GetPage(name: Routes.invitationRoute, page: () => InviteView()),
    GetPage(name: Routes.verifCodeRoute, page: () => VerifView()),
    GetPage(name: Routes.newPassRoute, page: () => NewPassView()),
    GetPage(name: Routes.dashboardRoute, page: () => DashboardView()),
  ];
}
