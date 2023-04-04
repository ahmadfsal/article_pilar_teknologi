class ConstantUrlHelper {
  static const String baseUrl = 'http://13.212.226.116:8000/api/';
  static const String register = 'register';
  static const String postSendResetPassword = 'auth/send-reset-password';
  static const String postResetPassword = 'auth/reset-password';
  static const String postChangePassword = 'auth/change-password';
  static const String postRefreshToken = 'auth/refresh-token';
  static const String postLogout = 'auth/logout';
  static const String postRegister = 'auth/register';
  static const String getAuthGoogle = 'auth/google/mobile';
  static const String getTermsAndConditions = 'page/terms-and-conditions';
  static const String getPrivacyPolicy = 'page/privacy-policy';

  // News
  static const String getListNews = 'news';
  static const String getListCategoriesPrimary = 'news-category-primary';
  static const String getListCategories = 'news/categories';
  static const String getNewsDetail = 'news/detail';
  static const String getListNewsFavorite = 'news-favorite';
  static const String getListAuthor = 'author';
  static const String getListDigitalPrint = 'digital-print';
  static const String getDetailDigitalPrint = 'digital-print/detail';
}
