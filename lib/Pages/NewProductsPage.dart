import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itecsa/Bloc/Bloc/GeneralBloc.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:itecsa/Bloc/Events/GeneralEvents.dart';
import 'package:itecsa/Bloc/States/GeneralStates.dart';
import 'package:itecsa/Models/Product.dart';

import '../Colors.dart';
class NewProductsPage extends StatefulWidget {
  @override
  _NewProductsPageState createState() => _NewProductsPageState();
}

class _NewProductsPageState extends State<NewProductsPage> {
  TextEditingController _name=TextEditingController();
  TextEditingController _company=TextEditingController();
  TextEditingController _description=TextEditingController();
  TextEditingController _amount=TextEditingController();
  TextEditingController _price=TextEditingController();
  String _picture="";
  Product _product=Product();
  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    // final picture= await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
      // _image = File(pickedFile.path);
      // _image=picture;
    });
  }
  firebase_storage.FirebaseStorage _storage = firebase_storage.FirebaseStorage.instance;

  Future<void> uploadPic() async {

    try {
      // print(_image);
      // print(_image.path);
      print(_image.path.split("/").length);
      // print(_image.path.split("/").last);
      // firebase_storage.Reference ref=firebase_storage.FirebaseStorage.instance.ref('Productos/${_image.path.split("/").last}');
      // firebase_storage.UploadTask uploadTask=ref.putFile(_image);
      // var downurl= await(await uploadTask.whenComplete(() => ref.getDownloadURL()));
      //desde aca
      await firebase_storage.FirebaseStorage.instance
          .ref('Productos/${_image.path.split("/").last}')
          .putFile(_image);

      String downloadURL = await (await firebase_storage.FirebaseStorage.instance)
          .ref('Productos/${_image.path.split("/").last}')
          .getDownloadURL();
      //hasta aca
      // print("llego a subir y obtener link");
      // _picture=downurl.toString();
      _picture=downloadURL;
      // print(downloadURL);
      // return downloadURL;
    } catch (e) {
      print(e);
    }
    //returns the download url

  }
  // Future<void>obtainUrl() async{
  //   String downloadURL = await firebase_storage.FirebaseStorage.instance
  //       .ref('Productos/${_image.path.split("/").last}')
  //       .getDownloadURL();
  //   // print("llego a subir y obtener link");
  //   _picture=downloadURL;
  // }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.black, Colors.transparent],
          ).createShader(rect),
          blendMode: BlendMode.darken,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background2.png"),
                fit: BoxFit.cover,
                //colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: color2,
            elevation: 5,
            title: Text("NUEVOS PRODUCTOS",style: TextStyle(fontSize: size.height*0.025,color: color1),),
          ),
          body: BlocListener<GeneralBloc,GeneralStates>(
            listener: (context,state){
              if(state is MenuConfirmState){Navigator.pop(context);}},
              child: SingleChildScrollView(
                child: Container(
                  height: size.height,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.width * 0.1,
                      ),
                      GestureDetector(
                        onTap: (){
                          getImage();
                          print("tocando");
                        },
                        child: Container(
                          height: size.width*0.4,
                          width: size.width*0.4,
                          color: color3,
                          child: _image!=null?Image.file(_image,fit: BoxFit.fill,):
                          Icon(Icons.add_photo_alternate_outlined,size: size.width*0.35,),
                        ),
                      ),
                      SizedBox(height: size.width*0.1,),
                      Container(
                        width: size.width * 0.97,
                        margin: EdgeInsets.only(left: 10,right: 10),
                        padding: EdgeInsets.only(left: 10,right: 10),
                        decoration: BoxDecoration(
                          color: color1.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.add_shopping_cart,color: color11,),
                            Container(
                              width: size.width*0.77,
                              child: TextField(
                                controller: _name,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(size.height * 0.01),
                                  labelText: "Nombre del Producto: ",
                                  border: InputBorder.none,
                                ),
                                // maxLines: 100,
                                style: TextStyle(color: color11),
                                cursorColor: color2,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.width * 0.06,
                      ),
                      Container(
                        width: size.width * 0.97,
                        margin: EdgeInsets.only(left: 10,right: 10),
                        padding: EdgeInsets.only(left: 10,right: 10),
                        decoration: BoxDecoration(
                          color: color1.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.home_work_outlined,color: color11,),
                            Container(
                              width: size.width*0.77,
                              child: TextField(
                                controller: _company,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(size.height * 0.01),
                                    labelText: "Empresa Proovedora: ",
                                    border: InputBorder.none
                                ),
                                // maxLines: 100,
                                style: TextStyle(color: color11),
                                cursorColor: color2,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.width * 0.06,
                      ),
                      Container(
                        width: size.width * 0.97,
                        margin: EdgeInsets.only(left: 10,right: 10),
                        padding: EdgeInsets.only(left: 10,right: 10),
                        decoration: BoxDecoration(
                          color: color1.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.assignment_outlined,color: color11,),
                            Container(
                              width: size.width*0.77,
                              child: TextField(
                                controller: _description,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(size.height * 0.01),
                                    labelText: "Descripción del Producto: ",
                                    border: InputBorder.none
                                ),
                                // maxLines: 100,
                                style: TextStyle(color: color11),
                                cursorColor: color2,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.width * 0.06,
                      ),
                      Container(
                        width: size.width * 0.97,
                        margin: EdgeInsets.only(left: 10,right: 10),
                        padding: EdgeInsets.only(left: 10,right: 10),
                        decoration: BoxDecoration(
                          color: color1.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(

                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.analytics_outlined,color: color11,),
                            Container(
                              width: size.width*0.77,
                              child: TextField(
                                controller: _amount,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(size.height * 0.01),
                                    labelText: "Stock: ",
                                    border: InputBorder.none
                                ),
                                // maxLines: 100,
                                style: TextStyle(color: color11),
                                cursorColor: color2,
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.width * 0.06,
                      ),
                      Container(
                        width: size.width * 0.97,
                        margin: EdgeInsets.only(left: 10,right: 10),
                        padding: EdgeInsets.only(left: 10,right: 10),
                        decoration: BoxDecoration(
                          color: color1.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(

                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.monetization_on_outlined,color: color11,),
                            Container(
                              width: size.width*0.77,
                              child: TextField(
                                controller: _price,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(size.height * 0.01),
                                    labelText: "Precio (Bs): ",
                                    border: InputBorder.none
                                ),
                                // maxLines: 100,
                                style: TextStyle(color: color11),
                                cursorColor: color2,
                                textInputAction: TextInputAction.done,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.width * 0.1,
                      ),
                      GestureDetector(
                        onTap: (){
                          if(_name.text!=null && _company.text!=null && _description.text!=null && _amount.text!=null && _price.text!=null && _image!=null){
                            print("cumple condiciones");
                            _product.name=_name.text;_product.company=_company.text;_product.description=_description.text;
                            _product.amount=int.parse(_amount.text);_product.price=double.parse(_price.text);
                            //funcion para subir imagen y obtener url
                            uploadPic();
                            // obtainUrl();
                            _product.image=_picture;
                            print("la imagen es:");
                            print(_product.image);
                            BlocProvider.of<GeneralBloc>(context).add(NewProductsEvent(_product));
                          }else
                            {
                              print("debe llenar todos los campos");
                            }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: size.width * 0.3,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: color2,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Añadir",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.05),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ),
      ],

    );
  }
}
