import 'package:get/get.dart';

import '../modules/app_navigation_screen/app_navigation_screen.dart';
import '../modules/app_navigation_screen/binding/app_navigation_binding.dart';
import '../modules/attendance_history_screen/attendance_history_screen.dart';
import '../modules/attendance_history_screen/binding/attendance_history_binding.dart';
import '../modules/attendance_input_screen/attendance_input_screen.dart';
import '../modules/attendance_input_screen/binding/attendance_input_binding.dart';
import '../modules/edit_profile_screen/binding/edit_profile_binding.dart';
import '../modules/edit_profile_screen/edit_profile_screen.dart';
import '../modules/forgot_password_screen/binding/forgot_password_binding.dart';
import '../modules/forgot_password_screen/forgot_password_screen.dart';
import '../modules/home_awal_screen/binding/home_awal_binding.dart';
import '../modules/home_awal_screen/home_awal_screen.dart';
import '../modules/home_unique_code_screen/binding/home_unique_code_binding.dart';
import '../modules/home_unique_code_screen/home_unique_code_screen.dart';
import '../modules/login_screen/binding/login_binding.dart';
import '../modules/login_screen/login_screen.dart';
import '../modules/my_profile_screen/binding/my_profile_binding.dart';
import '../modules/my_profile_screen/my_profile_screen.dart';
import '../modules/new_password_screen/binding/new_password_binding.dart';
import '../modules/new_password_screen/new_password_screen.dart';
import '../modules/sign_up_screen/binding/sign_up_binding.dart';
import '../modules/sign_up_screen/sign_up_screen.dart';
import '../modules/splash_screen/binding/splash_binding.dart';
import '../modules/splash_screen/splash_screen.dart';
import '../modules/take_a_selfie_screen/binding/take_a_selfie_binding.dart';
import '../modules/take_a_selfie_screen/take_a_selfie_screen.dart';
import '../modules/verify_email_screen/binding/verify_email_binding.dart';
import '../modules/verify_email_screen/verify_email_screen.dart';
import '../modules/welcome_screen/binding/welcome_binding.dart';
import '../modules/welcome_screen/welcome_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.SPLASH_SCREEN;
  static const INITIAL = Routes.TAKE_A_SELFIE_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.FORGOT_PASSWORD_SCREEN,
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: _Paths.VERIFY_EMAIL_SCREEN,
      page: () => VerifyEmailScreen(),
      bindings: [
        VerifyEmailBinding(),
      ],
    ),
    GetPage(
      name: _Paths.NEW_PASSWORD_SCREEN,
      page: () => NewPasswordScreen(),
      bindings: [
        NewPasswordBinding(),
      ],
    ),
    GetPage(
      name: _Paths.ATTENDANCE_INPUT_SCREEN,
      page: () => AttendanceInputScreen(),
      bindings: [
        AttendanceInputBinding(),
      ],
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: _Paths.HOME_AWAL_SCREEN,
      page: () => HomeAwalScreen(),
      bindings: [
        HomeAwalBinding(),
      ],
    ),
    GetPage(
      name: _Paths.HOME_UNIQUE_CODE_SCREEN,
      page: () => HomeUniqueCodeScreen(),
      bindings: [
        HomeUniqueCodeBinding(),
      ],
    ),
    GetPage(
      name: _Paths.TAKE_A_SELFIE_SCREEN,
      page: () => TakeASelfieScreen(),
      bindings: [
        TakeASelfieBinding(),
      ],
    ),
    GetPage(
      name: _Paths.WELCOME_SCREEN,
      page: () => WelcomeScreen(),
      bindings: [
        WelcomeBinding(),
      ],
    ),
    GetPage(
      name: _Paths.ATTENDANCE_HISTORY_SCREEN,
      page: () => AttendanceHistoryScreen(),
      bindings: [
        AttendanceHistoryBinding(),
      ],
    ),
    GetPage(
      name: _Paths.SIGN_UP_SCREEN,
      page: () => SignUpScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: _Paths.MY_PROFILE_SCREEN,
      page: () => MyProfileScreen(),
      bindings: [
        MyProfileBinding(),
      ],
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE_SCREEN,
      page: () => EditProfileScreen(),
      bindings: [
        EditProfileBinding(),
      ],
    ),
    GetPage(
      name: _Paths.APP_NAVIGATION_SCREEN,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    // GetPage(
    //   name: _Paths.initialRoute,
    //   page: () => SplashScreen(),
    //   bindings: [
    //     SplashBinding(),
    //   ],
    // )
  ];
}
