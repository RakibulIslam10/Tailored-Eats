part of 'routes.dart';

class RoutePageList {
  static var list = [
    //Page Route List
    GetPage(
      name: Routes.updateProfileScreen,
      page: () => const UpdateProfileScreen(),
      binding: UpdateProfileBinding(),
    ),
    GetPage(
      name: Routes.profileScreen,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.profile_creationScreen,
      page: () => const ProfileCreationScreen(),
      binding: ProfileCreationBinding(),
    ),
    GetPage(
      name: Routes.swapScreen,
      page: () => const SwapScreen(),
      binding: SwapBinding(),
    ),
    GetPage(
      name: Routes.detailsScreen,
      page: () => const DetailsScreen(),
      binding: DetailsBinding(),
    ),
    GetPage(
      name: Routes.friendsScreen,
      page: () => const FriendsScreen(),
      binding: FriendsBinding(),
    ),
    GetPage(
      name: Routes.profileScreen,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.consistencyScreen,
      page: () => const ConsistencyScreen(),
      binding: ConsistencyBinding(),
    ),
    GetPage(
      name: Routes.goalScreen,
      page: () => const GoalScreen(),
      binding: GoalBinding(),
    ),
    GetPage(
      name: Routes.nutritionScreen,
      page: () => const NutritionScreen(),
      binding: NutritionBinding(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.navigationScreen,
      page: () => const NavigationScreen(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: Routes.two_faScreen,
      page: () => const TwoFaScreen(),
      binding: TwoFaBinding(),
    ),
    GetPage(
      name: Routes.registerScreen,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.otpScreen,
      page: () => const OtpScreen(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: Routes.reset_passwordScreen,
      page: () => const ResetPasswordScreen(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: Routes.verificationScreen,
      page: () => const VerificationScreen(),
      binding: VerificationBinding(),
    ),
    GetPage(
      name: Routes.forget_passwordScreen,
      page: () => const ForgetPasswordScreen(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
  ];
}
