

import 'package:bloc/bloc.dart';
import 'package:itecsa/Bloc/Events/GeneralEvents.dart';
import 'package:itecsa/Bloc/Repository/ClientsRepository.dart';
import 'package:itecsa/Bloc/Repository/ProductsRepository.dart';
import 'package:itecsa/Bloc/States/GeneralStates.dart';
import 'package:itecsa/Bloc/States/LoginStates.dart';

class GeneralBloc extends Bloc<GeneralEvents,GeneralStates>{
  ClientsRepository _clientsRepository;
  ProductsRepository _productsRepository;

  GeneralBloc(this._clientsRepository,this._productsRepository);

  @override
  GeneralStates get initialState => MenuPageState();

  @override
  Stream<GeneralStates> mapEventToState(GeneralEvents event) async*{
    if(event is NewClientsEvent){
      yield LoadingPageState();
      await _clientsRepository.addClient(event.props[0]);
      yield MenuConfirmState();
    }else if(event is NewProductsEvent){
      yield LoadingPageState();
      await _productsRepository.addProduct(event.props[0]);
      yield MenuConfirmState();
    }else if(event is SelectProductsEvent){

    }else if(event is HistoryEvent){

    }
  }


}