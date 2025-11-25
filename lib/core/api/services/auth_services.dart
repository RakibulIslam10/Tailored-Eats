import '../../../routes/routes.dart';
import '../../../views/auth/register/model/register_model.dart';
import '../../../views/login/model/login_model.dart';
import '../../utils/app_storage.dart';
import '../../utils/basic_import.dart';
import '../end_point/api_end_points.dart';
import '../model/basic_success_model.dart';
import 'api_request.dart';

class AuthService {
  /// =============================================== ✅ Login  ================================================== ///
  static Future<LoginModel> loginService({
    required RxBool isLoading,
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> inputBody = {'email': email, 'password': password};
    return await ApiRequest.post(
      fromJson: LoginModel.fromJson,
      endPoint: ApiEndPoints.login,
      isLoading: isLoading,
      body: inputBody,
      onSuccess: (result) {
        AppStorage.save(token: result.data.accessToken, isLoggedIn: true);
        Get.offAllNamed(Routes.navigationScreen);
      },
    );
  }

  /// =============================================== ✅ Register  ================================================== ///
  static Future<RegisterModel> registerService({
    required RxBool isLoading,
    required String fullName,
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> inputBody = {
      'name': fullName,
      'email': email,
      'password': password,
    };

    return await ApiRequest.post(
      fromJson: RegisterModel.fromJson,
      endPoint: ApiEndPoints.register,
      isLoading: isLoading,
      body: inputBody,
      onSuccess: (result) {
        AppStorage.save(token: result.data.accessToken);
        Get.toNamed(Routes.profileCreationScreen);
      },
    );
  }

  // /// =============================================== ✅ Forget Password ================================================== ///
  static Future<BasicSuccessModel> forgotPasswordService({
    required RxBool isLoading,
    required String email,
  }) async {
    Map<String, dynamic> inputBody = {'email': email};
    return await ApiRequest.post(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.forgotPassword,
      isLoading: isLoading,
      body: inputBody,
      onSuccess: (result) {
        // AppStorage.save(temporaryToken: result.data.token);
        Get.toNamed(Routes.verificationScreen);
      },
    );
  }

  /// =============================================== ✅ Email Otp Verify  ================================================== ///

  static Future<BasicSuccessModel> forgetOtpVerifyService({
    required RxBool isLoading,
    required String code,
    required String email,
  }) async {
    Map<String, dynamic> inputBody = {'email': email, 'code': code};
    return await ApiRequest.post(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.verifyOtp,
      isLoading: isLoading,
      body: inputBody,
      onSuccess: (result) => Get.toNamed(Routes.resetPasswordScreen),
    );
  }

  /// =============================================== ✅ Reset Password ================================================== ///

  static Future<BasicSuccessModel> resetPasswordService({
    required RxBool isLoading,
    required String password,
    required String email,
  }) async {
    Map<String, dynamic> inputBody = {'email': email, 'newPassword': password};
    return await ApiRequest.patch(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.resetPassword,
      isLoading: isLoading,
      body: inputBody,
      showSuccessSnackBar: true,
      onSuccess: (result) => Get.offAllNamed(Routes.loginScreen),
    );
  }

  /// =============================================== ✅ Change Password ================================================== ///

  static Future<BasicSuccessModel> changePasswordService({
    required RxBool isLoading,
    required String oldPassword,
    required String newPassword,
  }) async {
    Map<String, dynamic> inputBody = {
      'currentPassword': oldPassword,
      'newPassword': newPassword,
      'confirmPassword': newPassword,
    };
    return await ApiRequest.patch(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.changePassword,
      isLoading: isLoading,
      body: inputBody,
      onSuccess: (result) => Get.close(1),
    );
  }
}
