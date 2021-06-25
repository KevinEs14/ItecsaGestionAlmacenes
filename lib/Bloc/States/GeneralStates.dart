

import 'package:equatable/equatable.dart';

abstract class GeneralStates extends Equatable {}

class LoginConfirmState extends GeneralStates {
  @override
  List<Object> get props => [];
}
class LoginNotConfirmState extends GeneralStates {
  @override
  List<Object> get props => [];
}
class LoginWaitState extends GeneralStates {
  @override
  List<Object> get props => [];
}
class LoadingState extends GeneralStates{
  @override
  List<Object> get props => throw UnimplementedError();

}
class MenuPageState extends GeneralStates{
  @override
  List<Object> get props => throw UnimplementedError();

}
