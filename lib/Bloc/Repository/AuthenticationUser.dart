
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthRepository{
  int _response;

  int get response => _response;

  set response(int value) {
    _response = value;
  }

  Future<void>getAccount(String account,String password)async{
    print("entra a la funcion");
    try {
      print(account);
      print(password);
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: account,
          password: password
      );
      print(userCredential);
      response=1;
    } catch(e){
      print(e);
      response=0;
    }
    // on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     print('No user found for that email.');
    //     response=0;
    //   } else if (e.code == 'wrong-password') {
    //     print('Wrong password provided for that user.');
    //     response=0;
    //   }
    // }
  }
  Future<void> verifyAccount()async{

    try{
      await Firebase.initializeApp();
      if(FirebaseAuth.instance.currentUser!=null){
        response=1;
      }else{
        response=0;
      }

    }catch(e){
      print(e);
      response=0;
    }
  }

  Future<void>signOutAccount()async{

    try{
      await FirebaseAuth.instance.signOut();
      response=0;
    }catch(e){
      print(e);
    }

  }
}