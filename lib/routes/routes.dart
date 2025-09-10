import 'package:get/get_navigation/src/routes/get_route.dart';

import '../bind/consistency_binding.dart';
import '../bind/forget_password_binding.dart';
import '../bind/friends_binding.dart';
import '../bind/goal_binding.dart';
import '../bind/home_binding.dart';
import '../bind/login_binding.dart';
import '../bind/navigation_binding.dart';
import '../bind/nutrition_binding.dart';
import '../bind/otp_binding.dart';
import '../bind/profile_binding.dart';
import '../bind/register_binding.dart';
import '../bind/reset_password_binding.dart';
import '../bind/splash_binding.dart';
import '../bind/two_fa_binding.dart';
import '../bind/verification_binding.dart';
import '../bind/welcome_binding.dart';
import '../views/auth/forget_password/screen/forget_password_screen.dart';
import '../views/auth/login/screen/login_screen.dart';
import '../views/auth/otp/screen/otp_screen.dart';
import '../views/auth/register/screen/register_screen.dart';
import '../views/auth/reset_password/screen/reset_password_screen.dart';
import '../views/auth/two_fa/screen/two_fa_screen.dart';
import '../views/auth/verification/screen/verification_screen.dart';
import '../views/consistency/screen/consistency_screen.dart';
import '../views/friends/screen/friends_screen.dart';
import '../views/goal/screen/goal_screen.dart';
import '../views/home/screen/home_screen.dart';
import '../views/navigation/screen/navigation_screen.dart';
import '../views/nutrition/screen/nutrition_screen.dart';
import '../views/profile/screen/profile_screen.dart';
import '../views/splash/screen/splash_screen.dart';

import '../views/welcome/screen/welcome_screen.dart';

part 'pages.dart';

class Routes {
  static var list = RoutePageList.list;
static const friendsScreen = '/friendsScreen';
static const profileScreen = '/profileScreen';
static const consistencyScreen = '/consistencyScreen';
static const goalScreen = '/goalScreen';
static const nutritionScreen = '/nutritionScreen';
static const homeScreen = '/homeScreen';
static const navigationScreen = '/navigationScreen';
static const two_faScreen = '/two_faScreen';
static const registerScreen = '/registerScreen';
  static const otpScreen = '/otpScreen';
  static const reset_passwordScreen = '/reset_passwordScreen';
  static const verificationScreen = '/verificationScreen';
  static const forget_passwordScreen = '/forget_passwordScreen';
  static const loginScreen = '/loginScreen';
  static const welcomeScreen = '/welcomeScreen';
  static const splashScreen = '/splashScreen';
}
