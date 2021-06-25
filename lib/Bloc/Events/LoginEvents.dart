

import 'package:equatable/equatable.dart';

abstract class LoginEvents extends Equatable {}
class LoginConfirmedEvent extends LoginEvents{
  @override
  List<Object> get props => throw UnimplementedError();

}
class LoginTryEvent extends LoginEvents{
  String _account;
  String _password;
  LoginTryEvent(this._account,this._password);

  @override
  List<Object> get props =>[_account,_password];

}
class LoginSingOutEvent extends LoginEvents{
  @override
  List<Object> get props => throw UnimplementedError();

}