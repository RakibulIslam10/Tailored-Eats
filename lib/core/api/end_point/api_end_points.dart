class ApiEndPoints {
  static final mainDomain = 'https://p2zltbm7-8002.inc1.devtunnels.ms';
  static final baseUrl = '$mainDomain/api/v1/';

  static final aiBaseUrl = 'https://thfgnbd8-8000.asse.devtunnels.ms/';


  static const addFavorite = 'favorite/add';
  static const removeFavorite = 'favorite/remove';
  static const getAllFavorites = 'favorite';

  // Auth
  static const login = 'auth/login';
  static const register = 'auth/register';
  static const verifyOtp = 'auth/forget-password-check-otp';
  static const resetPassword = 'auth/reset-password';
  static const forgotPassword = 'auth/forget-password';
  static const changePassword = 'settings/change-password';

  //home
  static const macros = 'user/user-detail';
  static const consistencyGet = 'consistency/user-consistency-details';

  // goal
  static const getALlGoal = 'goal/get-all-goal';
  static const createGoal = 'goal/create-new-goal';
  static const deleteGoal = 'goal/delete-goal';
  static const updateGoal = 'goal/update-goal';
  static const goalMark = 'goal/mark-goal-completed';

  // Friends
  static const getAllFriends = 'friend/get-all-friend';
  static const getAllFriendRequest = 'friend/get-all-friend-request';
  static const friendDetails = 'friend/friend-detail';
  static const acceptRequest = 'friend/accept-request';
  static const rejectRequest = 'friend/reject-request';
  static const unfriedRequest = 'friend/make-unfriend';

  // progression
  static const getWeightControl = 'consistency/get-user-weight';
  static const userImagesProgress = 'consistency/get-user-image';
  static const addImagesProgress = 'consistency/add-user-image';

  static const addWeight = 'consistency/add-user-weight';
  static const category = 'categories';
  static const privacy = 'manage/get-privacy-policy';
  static const terms = 'settings/get-terms';
  static const privacyPolicy = 'settings/get-privacy';
  static const oldCrisisProduct = 'products/oldcrisis';
  static const getAllBookCategory = 'book-categories/get';
  static const favourites = 'favourites';
  static const news = 'news';
  static const notifications = 'notification/get-all-notification';

  //category
  static const byCategory = 'products/by-category';
  static const products = 'products';
  static const swaps = 'swaps';

  //profile
  static const updateAddress = 'users/add-address';
  static const uploadAvatar = 'users/avatar';
  static const faq = 'faq/get-all-faq';
  static const support = 'settings/send-admin-email';
  static const updateProfileInfo = 'users';
  static const updateProfile = 'user/update-profile';
  static const termsPolicy = 'policies';
  static const completeProfile = 'user/complete-profile';
  static const userProfile = 'auth/me';
  static const deleteProfile = 'settings/delete-account';

  //Builder Fit
  static const getAllFolders = 'builder/folders';
  static const createFolder = 'builder';
  static const folderItems = 'builder/folders/items';
  static const deleteFolder = 'builder/folders';
  static const builderItem = 'builder/item';

  // add to cart
  static const addToCart = 'carts/add-item';
  static const cartsItems = 'carts/items';
  static const deleteCart = 'carts';
  static const templates = 'templates';
  static const myAllProducts = 'products/my-products';

  //product
  static const orders = 'orders';
  static const orderStatus = 'orders?status=';

  //Payments
  static const payments = 'payments/create';

  //Chat
  static const allAdmins = 'chats/rooms';
  static const chats = 'chats';
  static const allMessage = 'chats/messages';
  static const updateQnt = 'carts/quantity';
}
