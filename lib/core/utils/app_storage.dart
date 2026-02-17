import 'package:get_storage/get_storage.dart';
import 'app_storage_model.dart';

class AppStorage {
  static final GetStorage _storage = GetStorage();

  static const String tokenKey = 'token';
  static const String userIdKey = 'userId';
  static const String userEmailKey = 'userEmail';
  static const String temporaryTokenKey = 'temporaryToken';
  static const String mobileCodeKey = 'mobileCode';
  static const String onboardSaveKey = 'onboardSave';
  static const String waitTimeKey = 'waitTime';
  static const String isLoggedInKey = 'isLoggedIn';
  static const String isEmailVerifiedKey = 'isEmailVerified';
  static const String isKycVerifiedKey = 'isKycVerified';
  static const String isSmsVerifiedKey = 'isSmsVerified';
  static const String kycStatusKey = 'isKycStatus';

  static Future<void> save({
    String? token,
    String? userId,
    String? userEmail,
    String? temporaryToken,
    String? mobileCode,
    bool? onboardSave,
    String? waitTime,
    bool? isLoggedIn,
    bool? isEmailVerified,
    bool? isKycVerified,
    bool? isSmsVerified,
    bool? isKycStatus,
  }) async {
    if (token != null) await _storage.write(tokenKey, token);
    if (userId != null) await _storage.write(userIdKey, userId);
    if (userEmail != null) await _storage.write(userEmailKey, userEmail);
    if (temporaryToken != null) await _storage.write(temporaryTokenKey, temporaryToken);
    if (mobileCode != null) await _storage.write(mobileCodeKey, mobileCode);
    if (onboardSave != null) await _storage.write(onboardSaveKey, onboardSave);
    if (waitTime != null) await _storage.write(waitTimeKey, waitTime);
    if (isLoggedIn != null) await _storage.write(isLoggedInKey, isLoggedIn);
    if (isEmailVerified != null) await _storage.write(isEmailVerifiedKey, isEmailVerified);
    if (isKycVerified != null) await _storage.write(isKycVerifiedKey, isKycVerified);
    if (isSmsVerified != null) await _storage.write(isSmsVerifiedKey, isSmsVerified);
    if (isKycStatus != null) await _storage.write(kycStatusKey, isKycStatus);
  }

  static String get token => _storage.read(tokenKey) ?? '';
  static String get userId => _storage.read(userIdKey) ?? '';
  static String get userEmail => _storage.read(userEmailKey) ?? '';
  static String get temporaryToken => _storage.read(temporaryTokenKey) ?? '';
  static String get mobileCode => _storage.read(mobileCodeKey) ?? '';
  static String get waitTime => _storage.read(waitTimeKey) ?? '01:00';
  static bool get isLoggedIn => _storage.read(isLoggedInKey) ?? false;
  static bool get onboardSave => _storage.read(onboardSaveKey) ?? false;
  static bool get isKycVerified => _storage.read(isKycVerifiedKey) ?? false;
  static bool get isEmailVerified => _storage.read(isEmailVerifiedKey) ?? false;
  static bool get isSmsVerified => _storage.read(isSmsVerifiedKey) ?? false;
  static bool get isKycStatus => _storage.read(kycStatusKey) ?? false;

  static AppStorageModel get common {
    return AppStorageModel(
      _storage.read(tokenKey) ?? '',
      _storage.read(userIdKey) ?? '',
      _storage.read(userEmailKey) ?? '',
      _storage.read(onboardSaveKey) ?? false,
      _storage.read(waitTimeKey) ?? '01:00',
      _storage.read(isLoggedInKey) ?? false,
      _storage.read(isEmailVerifiedKey) ?? false,
      _storage.read(isKycVerifiedKey) ?? false,
      _storage.read(isSmsVerifiedKey) ?? false,
      _storage.read(kycStatusKey) ?? 0,
      temporaryToken: _storage.read(temporaryTokenKey) ?? '',
      mobileCode: _storage.read(mobileCodeKey) ?? '',
    );
  }
    static Future<void> clear() async {
    await _storage.erase();
  }
}
