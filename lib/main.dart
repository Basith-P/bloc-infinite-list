import 'package:bloc/bloc.dart' show Bloc;
import 'package:flutter/material.dart' show runApp;

import 'app.dart';
import 'bloc_observer.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  runApp(const App());
}
