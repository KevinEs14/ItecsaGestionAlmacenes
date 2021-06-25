import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itecsa/Bloc/Bloc/LoginBloc.dart';
import 'package:itecsa/Bloc/Events/LoginEvents.dart';
import 'package:itecsa/Bloc/Repository/AuthenticationUser.dart';
import 'package:itecsa/Bloc/States/LoginStates.dart';
import 'package:itecsa/Pages/LoginPage.dart';
import 'package:itecsa/Pages/MenuPage.dart';

import 'Pages/LoadingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context)=>LoginBloc(AuthRepository())..add(LoginConfirmedEvent()),
        child: BlocBuilder<LoginBloc,LoginStates>(
          builder: (context,state){
            if(state is LoginConfirmState){
              return MenuPage();
            }else if(state is LoginNotConfirmState){
              return LoginPage();
            }else {
              return LoadingPage();
            }
          },
        ),
      ),
    );
  }
}

