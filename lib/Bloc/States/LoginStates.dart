

import 'package:equatable/equatable.dart';

abstract class LoginStates extends Equatable {}

class LoginConfirmState extends LoginStates {
  @override
  List<Object> get props => [];
}
class LoginNotConfirmState extends LoginStates {
  @override
  List<Object> get props => [];
}
class LoginWaitState extends LoginStates {
  @override
  List<Object> get props => [];
}
class LoadingState extends LoginStates{
  @override
  List<Object> get props => throw UnimplementedError();

}
