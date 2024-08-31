class AppStrings {
  static const Map<String, String> signIn = {
    'email': 'Enter your email',
    'password': 'Enter your password',
    'btn': 'SIGN IN'
  };
  static const Map<String, String> createAccount = {
    'email': 'Enter your email',
    'password': 'Enter your password',
    'confirmPassword': 'Confirm your password',
    'btn': 'CREATE ACCOUNT'
  };
  static const imageUrl = String.fromEnvironment('imageUrl');
  static const baseURL = String.fromEnvironment('baseURL');
  static const apiKey = String.fromEnvironment('apiKey');
  static const accessToken = String.fromEnvironment('accessToken');
}

class AppRoutes {
  static const splash = "/";
  static const signIn = "/sign-in";
  static const signUp = "/sign-up";
  static const movies = "/movies";
  static const tickets = "/tickets";
  static const favorites = "/favorites";
  static const profile = "/profile";
  static const movieDetail = "/movie-detail";
  static const castDetail = "/cast-detail";
  static const chooseSession = "/choose-session";
  static const chooseSeat = "/choose-seat";
  static const payment = "/payment";
  static const addCard = "/add-card";
  static const paymentMethods = "/payment-methods";
  static const bookingConfirmed = "/booking-confirmed";
}

class ModelHiveId {
  static const cast = 0;
  static const actor = 1;
  static const movie = 2;
}

class HiveBox {
  static const movieBox = 'enc_hive_move';
  static const castBox = 'enc_hive_cast';
  static const actorBox = 'enc_hive_actor';
}