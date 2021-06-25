

import 'package:equatable/equatable.dart';

abstract class GeneralEvents extends Equatable {}
class LoginConfirmedEvent extends GeneralEvents{
  @override
  List<Object> get props => throw UnimplementedError();

}
class LoginTryEvent extends GeneralEvents{
  @override
  List<Object> get props => throw UnimplementedError();

}
class LoginSingOutEvent extends GeneralEvents{
  @override
  List<Object> get props => throw UnimplementedError();

}