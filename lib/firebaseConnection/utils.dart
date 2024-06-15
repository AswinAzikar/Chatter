import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'firebase_options.dart';

Future<void> setupFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> registerServices() async {
  final GetIt getIt = GetIt.asNewInstance();
  getIt.registerSingleton(
   AuthService();
  );
}
