

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:itecsa/Bloc/Events/LoginEvents.dart';
import 'package:itecsa/Bloc/Repository/AuthenticationUser.dart';
import 'package:itecsa/Bloc/States/LoginStates.dart';

class LoginBloc extends Bloc<LoginEvents,LoginStates>{
  AuthRepository _authRepository;
  LoginBloc(this._authRepository);
  @override
  LoginStates get initialState => LoadingState();

  @override
  Stream<LoginStates> mapEventToState(LoginEvents event) async*{
    if(event is LoginConfirmedEvent){
      yield LoginNotConfirmState();
    }else if(event is LoginTryEvent){
      await _authRepository.getAccount(event.props[0], event.props[1]);
      if(_authRepository.response==1){
        yield LoginConfirmState();
      }else{
        yield LoginNotConfirmState();
      }
    }
  }
  
}