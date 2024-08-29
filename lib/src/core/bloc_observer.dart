import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:logger/logger.dart';

// var logger = Logger(
//   printer: PrettyPrinter(),
// );

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    // logger.i(event.toString());
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // logger.w(change.toString());
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    // logger.i(bloc.toString());
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // logger.i(transition.toString());
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // logger.e(error.toString());
    super.onError(bloc, error, stackTrace);
  }
}