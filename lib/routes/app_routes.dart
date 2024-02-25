import 'package:hifdzi_s_application3/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:hifdzi_s_application3/presentation/forgot_password_screen/binding/forgot_password_binding.dart';
import 'package:hifdzi_s_application3/presentation/verify_email_screen/verify_email_screen.dart';
import 'package:hifdzi_s_application3/presentation/verify_email_screen/binding/verify_email_binding.dart';
import 'package:hifdzi_s_application3/presentation/new_password_screen/new_password_screen.dart';
import 'package:hifdzi_s_application3/presentation/new_password_screen/binding/new_password_binding.dart';
import 'package:hifdzi_s_application3/presentation/attendance_input_screen/attendance_input_screen.dart';
import 'package:hifdzi_s_application3/presentation/attendance_input_screen/binding/attendance_input_binding.dart';
import 'package:hifdzi_s_application3/presentation/splash_screen/splash_screen.dart';
import 'package:hifdzi_s_application3/presentation/splash_screen/binding/splash_binding.dart';
import 'package:hifdzi_s_application3/presentation/login_screen/login_screen.dart';
import 'package:hifdzi_s_application3/presentation/login_screen/binding/login_binding.dart';
import 'package:hifdzi_s_application3/presentation/home_awal_screen/home_awal_screen.dart';
import 'package:hifdzi_s_application3/presentation/home_awal_screen/binding/home_awal_binding.dart';
import 'package:hifdzi_s_application3/presentation/home_unique_code_screen/home_unique_code_screen.dart';
import 'package:hifdzi_s_application3/presentation/home_unique_code_screen/binding/home_unique_code_binding.dart';
import 'package:hifdzi_s_application3/presentation/take_a_selfie_screen/take_a_selfie_screen.dart';
import 'package:hifdzi_s_application3/presentation/take_a_selfie_screen/binding/take_a_selfie_binding.dart';
import 'package:hifdzi_s_application3/presentation/welcome_screen/welcome_screen.dart';
import 'package:hifdzi_s_application3/presentation/welcome_screen/binding/welcome_binding.dart';
import 'package:hifdzi_s_application3/presentation/attendance_history_screen/attendance_history_screen.dart';
import 'package:hifdzi_s_application3/presentation/attendance_history_screen/binding/attendance_history_binding.dart';
import 'package:hifdzi_s_application3/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:hifdzi_s_application3/presentation/sign_up_screen/binding/sign_up_binding.dart';
import 'package:hifdzi_s_application3/presentation/my_profile_screen/my_profile_screen.dart';
import 'package:hifdzi_s_application3/presentation/my_profile_screen/binding/my_profile_binding.dart';
import 'package:hifdzi_s_application3/presentation/edit_profile_screen/edit_profile_screen.dart';
import 'package:hifdzi_s_application3/presentation/edit_profile_screen/binding/edit_profile_binding.dart';
import 'package:hifdzi_s_application3/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:hifdzi_s_application3/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String verifyEmailScreen = '/verify_email_screen';

  static const String newPasswordScreen = '/new_password_screen';

  static const String attendanceInputScreen = '/attendance_input_screen';

  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String homeAwalScreen = '/home_awal_screen';

  static const String homeUniqueCodeScreen = '/home_unique_code_screen';

  static const String takeASelfieScreen = '/take_a_selfie_screen';

  static const String welcomeScreen = '/welcome_screen';

  static const String attendanceHistoryScreen = '/attendance_history_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String myProfileScreen = '/my_profile_screen';

  static const String editProfileScreen = '/edit_profile_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      bindings: [
        ForgotPasswordBinding(),
      ],
    ),
    GetPage(
      name: verifyEmailScreen,
      page: () => VerifyEmailScreen(),
      bindings: [
        VerifyEmailBinding(),
      ],
    ),
    GetPage(
      name: newPasswordScreen,
      page: () => NewPasswordScreen(),
      bindings: [
        NewPasswordBinding(),
      ],
    ),
    GetPage(
      name: attendanceInputScreen,
      page: () => AttendanceInputScreen(),
      bindings: [
        AttendanceInputBinding(),
      ],
    ),
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: homeAwalScreen,
      page: () => HomeAwalScreen(),
      bindings: [
        HomeAwalBinding(),
      ],
    ),
    GetPage(
      name: homeUniqueCodeScreen,
      page: () => HomeUniqueCodeScreen(),
      bindings: [
        HomeUniqueCodeBinding(),
      ],
    ),
    GetPage(
      name: takeASelfieScreen,
      page: () => TakeASelfieScreen(),
      bindings: [
        TakeASelfieBinding(),
      ],
    ),
    GetPage(
      name: welcomeScreen,
      page: () => WelcomeScreen(),
      bindings: [
        WelcomeBinding(),
      ],
    ),
    GetPage(
      name: attendanceHistoryScreen,
      page: () => AttendanceHistoryScreen(),
      bindings: [
        AttendanceHistoryBinding(),
      ],
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: myProfileScreen,
      page: () => MyProfileScreen(),
      bindings: [
        MyProfileBinding(),
      ],
    ),
    GetPage(
      name: editProfileScreen,
      page: () => EditProfileScreen(),
      bindings: [
        EditProfileBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    )
  ];
}
