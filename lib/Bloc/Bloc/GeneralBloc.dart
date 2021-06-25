

import 'package:bloc/bloc.dart';
import 'package:itecsa/Bloc/Events/GeneralEvents.dart';
import 'package:itecsa/Bloc/States/GeneralStates.dart';
import 'package:itecsa/Bloc/States/LoginStates.dart';

class GeneralBloc extends Bloc<GeneralEvents,GeneralStates>{
  @override
  // TODO: implement initialState
  GeneralStates get initialState => MenuPageState();

  @override
  Stream<GeneralStates> mapEventToState(event) {
    throw UnimplementedError();
  }


}