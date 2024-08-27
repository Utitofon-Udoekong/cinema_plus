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
  static const imageUrl = 'https://image.tmdb.org/t/p/original';
  static const baseURL = 'https://api.themoviedb.org/3';
  static const apiKey = '6735a4d498a1b54652e3227d03b43934';
  static const acessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NzM1YTRkNDk4YTFiNTQ2NTJlMzIyN2QwM2I0MzkzNCIsIm5iZiI6MTcyMzE1MDE0MS44NjE4MjEsInN1YiI6IjY2YjUyOTcxMDJmYTBkNDA5Yjk4ZWQ1NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rePa3b1W4tikPFJbe_Mni08NBKA0wEv4B-kA9gC0NXQ';
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
