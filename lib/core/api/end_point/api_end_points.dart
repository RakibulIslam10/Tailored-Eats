class ApiEndPoints {
  static final mainDomain = 'http://10.10.20.57:8002';
  static final baseUrl = '$mainDomain/api/v1/';

  // Auth
  static const login = 'auth/login';
  static const register = 'auth/register';
  static const verifyOtp = 'users/verify-otp';
  static const resetPassword = 'users/reset-password';
  static const forgotPassword = 'users/forget-password';
  static const changePassword = 'users/password';

  //home
  static const homePageData = 'products/homepage';
  static const category = 'categories';
  static const privacy = 'manage/get-privacy-policy';
  static const terms = 'manage/get-terms-conditions';
  static const oldCrisisProduct = 'products/oldcrisis';
  static const getAllBookCategory = 'book-categories/get';
  static const favourites = 'favourites';
  static const news = 'news';
  static const notifications = 'notifications';

  //category
  static const byCategory = 'products/by-category';
  static const products = 'products';
  static const swaps = 'swaps';

  //profile
  static const updateAddress = 'users/add-address';
  static const uploadAvatar = 'users/avatar';
  static const updateProfileInfo = 'users';
  static const termsPolicy = 'policies';
  static const userProfile = 'auth/me';
  static const deleteProfile = 'users';

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
