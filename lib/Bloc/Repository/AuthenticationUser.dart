
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository{
  int _response;

  int get response => _response;

  set response(int value) {
    _response = value;
  }

  Future<void>getAccount(String account,String password)async{
    // final auth=FirebaseAuth.instance;
    // User user;
    // Timer timer;
    // user=auth.currentUser;
    // await user.reload();
    // // user.sendEmailVerification();
    // if(user.emailVerified){
    //   response=1;
    // }else{
    //   response=0;
    // }
    print("entra a la funcion");
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: account,
          password: password
      );
      response=1;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        response=0;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        response=0;
      }
    }
  }
}