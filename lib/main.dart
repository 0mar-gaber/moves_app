import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:moves_app/core/DI/di.dart';
import 'package:moves_app/core/api/api_manger.dart';
import 'core/myopserver.dart';
import 'moves_app.dart';

void main(){
  ApiManager.init();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(const MovesApp());

}
