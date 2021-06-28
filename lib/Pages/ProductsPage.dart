import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase/firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itecsa/Components/Card.dart';

import '../Colors.dart';
class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<String> lista=['hola','mundo','esta','es','una','prueba'];
  Query query = FirebaseFirestore.instance.collection('Productos');
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Stack(
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
                    image: AssetImage("assets/images/background4.png"),
                    fit: BoxFit.cover,
                    //colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
                  ),
                ),
              ),
            ),
            Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    backgroundColor: color2,
                    elevation: 5,
                    title: Text("PRODUCTOS",style: TextStyle(fontSize: size.height*0.025,color: color1),),
                  ),
                  body: StreamBuilder<QuerySnapshot>(
                    stream: query.snapshots(),
                    builder: (context,stream){
                      if (stream.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (stream.hasError) {
                        return Center(child: Text(stream.error.toString()));
                      }
                      QuerySnapshot querySnapshot = stream.data;
                      // print("datos del query");
                      // print(querySnapshot.docs[0]["nombre"]);
                      return SingleChildScrollView(
                        child: Container(
                          height: size.height,
                          width: size.width,
                          padding: EdgeInsets.only(bottom: size.height*0.1),
                          child: ListView.builder(
                            //padding: EdgeInsets.only(top: 5,bottom: 20),
                              itemCount: querySnapshot.size,
                              itemBuilder: (context,index){
                                return Column(
                                  children: [
                                    SizedBox(height: size.height*0.005),
                                    NewCard(size.width*0.97,size.height*0.2,querySnapshot,index),
                                    SizedBox(height: size.height*0.01),

                                  ],
                                );
                              }
                          ),
                        ),
                      );
                    },
                  ),
                ),
          ],
        ),
    );
  }
}
