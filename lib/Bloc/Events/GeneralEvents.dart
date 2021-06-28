

import 'package:equatable/equatable.dart';
import 'package:itecsa/Models/Client.dart';
import 'package:itecsa/Models/Product.dart';

abstract class GeneralEvents extends Equatable {}
class SelectProductsEvent extends GeneralEvents{
  @override
  List<Object> get props => throw UnimplementedError();

}
class NewClientsEvent extends GeneralEvents{
  Client _client;
  NewClientsEvent(this._client);

  @override
  List<Object> get props => [_client];

}
class NewProductsEvent extends GeneralEvents{
  Product _product;
  NewProductsEvent(this._product);
  @override
  List<Object> get props => [_product];
}
class HistoryEvent extends GeneralEvents{
  @override
  List<Object> get props => [];

}
class ListProductsEvent extends GeneralEvents{
  @override
  List<Object> get props => [];

}