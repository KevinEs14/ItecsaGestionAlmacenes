import 'package:flutter/material.dart';

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
          body: SingleChildScrollView(
            child: Container(
              height: size.height,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.width * 0.1,
                  ),
                  Container(
                    height: size.width*0.4,
                    width: size.width*0.4,
                    color: color3,
                    child: Icon(Icons.add_photo_alternate_outlined,size: size.width*0.35,),
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
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.1,
                  ),
                  Container(
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
                ],
              ),
            ),
          ),
        ),
      ],

    );
  }
}
