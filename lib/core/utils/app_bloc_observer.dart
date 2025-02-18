import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log('current:${transition.currentState} event:${transition.event} next:${transition.nextState}',
        name: "${bloc.runtimeType}");
  }
}
