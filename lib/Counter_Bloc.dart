import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvents { increment, decrement }

class CounterBloc extends Bloc<CounterEvents, int> {
  //Declaring the initial State
  @override
  int get initialState => 0;

  CounterBloc(int initialState) : super(initialState) {
    on<CounterEvents>((event, emit) {
      switch (event) {
        case CounterEvents.increment:
          emit(state + 1);
          break;
        case CounterEvents.decrement:
          if (state == 0) {
            emit(state);
          } else {
            emit(state - 1);
          }

          break;
      }
    });
  }
}
