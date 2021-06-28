
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase/firestore.dart';
import 'package:itecsa/Models/Client.dart';

class ClientsRepository{
  List<Client> _listClients;

  List<Client> get listClients => _listClients;

  set listClients(List<Client> value) {
    _listClients = value;
  }
  Future<void>addClient(Client client)async{
    print("entro a addClientRepository");
    FirebaseFirestore.instance.collection("Clientes").add({
      "direccion": client.direction,
      "empresa": client.company,
      "nombre": client.name,
      "telefono": client.phone
    }).then((value) => print(value.id));
  }

  Future<void>clientList()async{}
}