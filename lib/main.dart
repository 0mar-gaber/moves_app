import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moves_app/core/DI/di.dart';
import 'package:moves_app/core/api/api_manger.dart';
import 'package:moves_app/presentation/shared_provider/shared_provider.dart';
import 'package:provider/provider.dart';
import 'core/myopserver.dart';
import 'moves_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ApiManager.init();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(ChangeNotifierProvider(
      create: (context) => SharedProvider()..getAddedMoviesIds(FirebaseAuth.instance.currentUser!.uid),
      child: const MovesApp()));

}
