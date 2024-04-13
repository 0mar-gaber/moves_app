import 'package:bloc/bloc.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moves_app/core/DI/di.dart';
import 'package:moves_app/core/api/api_manger.dart';
import 'core/myopserver.dart';
import 'moves_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FastCachedImageConfig.init(clearCacheAfter: const Duration(days: 15));
  ApiManager.init();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(const MovesApp());

}
