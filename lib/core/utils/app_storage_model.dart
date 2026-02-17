class AppStorageModel {
  final String token;
  final String userId;
  final String userEmail;
  final String temporaryToken;
  final String mobileCode;
  final bool onboardSave;
  final String waitTime;
  final bool isLoggedIn;
  final bool isEmailVerified;
  final bool isKycVerified;
  final bool isSmsVerified;
  final int kycStatus;

  AppStorageModel(
    this.token,
    this.userId,
    this.userEmail,
    this.onboardSave,
    this.waitTime,
    this.isLoggedIn,
    this.isEmailVerified,
    this.isKycVerified,
    this.isSmsVerified,
    this.kycStatus, {
    required this.temporaryToken,
    required this.mobileCode,
  });
}
