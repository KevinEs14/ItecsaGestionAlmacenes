
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase/firestore.dart';
import 'package:itecsa/Models/Client.dart';
import 'package:itecsa/Models/Product.dart';

class ProductsRepository{
  List<Product> _listProducts;


  List<Product> get listProducts => _listProducts;

  set listProducts(List<Product> value) {
    _listProducts = value;
  }

  Future<void>addProduct(Product product)async{
    print("entro a addProductRepository");
    FirebaseFirestore.instance.collection("Productos").add({
      "descripcion": product.description,
      "imagen": product.image,
      "nombre": product.name,
      "precio": product.price,
      "proveedor": product.company,
      "stock": product.amount
    }).then((value) => print(value.id));
  }

  Future<void>productsList()async{}
}