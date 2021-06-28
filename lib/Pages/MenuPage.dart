import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itecsa/Bloc/Bloc/GeneralBloc.dart';
import 'package:itecsa/Bloc/Bloc/LoginBloc.dart';
import 'package:itecsa/Bloc/Events/GeneralEvents.dart';
import 'package:itecsa/Bloc/Events/LoginEvents.dart';
import 'package:itecsa/Bloc/Repository/AuthenticationUser.dart';
import 'package:itecsa/Bloc/Repository/ClientsRepository.dart';
import 'package:itecsa/Bloc/Repository/ProductsRepository.dart';
import 'package:itecsa/Bloc/States/GeneralStates.dart';
import 'package:itecsa/Bloc/States/LoginStates.dart';
import 'package:itecsa/Pages/ClientsPage.dart';
import 'package:itecsa/Pages/LoadingPage.dart';
import 'package:itecsa/Pages/NewProductsPage.dart';
import 'package:itecsa/Pages/ProductsPage.dart';

import '../Colors.dart';
import 'HistoryPage.dart';
class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context)=>GeneralBloc(ClientsRepository(),ProductsRepository()),
      child: BlocBuilder<GeneralBloc,GeneralStates>(
          builder: (context,state){
            if(state is MenuConfirmState) {
              return SafeArea(
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/background3.png"),
                              fit: BoxFit.cover,
                              //colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                            ),
                          ),
                        ),

                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: size.width * 0.07,
                                  right: size.width * 0.06,
                                  top: size.width * 0.06),
                              height: size.height * 0.08,
                              width: size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Icon(Icons.menu, color: color1,
                                    size: size.height * 0.05,),
                                  Icon(Icons.exit_to_app, color: color1,
                                    size: size.height * 0.06,),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * 0.1,),
                            Container(
                              width: size.width * 0.65,
                              child: Image(image: AssetImage(
                                  'assets/images/logoItecsa4.png'),),
                            ),
                            // Text("ITECSA",style: TextStyle(fontSize: size.height*0.05,color: color1,fontWeight: FontWeight.bold),),
                            SizedBox(height: size.height * 0.15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<GeneralBloc>(context).add(ListProductsEvent());
                                    // Navigator.push(context, MaterialPageRoute(
                                    //     builder: (context) => ProductsPage()));
                                  },
                                  child: Container(
                                    height: size.width * 0.3,
                                    width: size.width * 0.35,
                                    //padding: EdgeInsets.only(left: size.height*0.015,right: size.height*0.015),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: color2
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Icon(Icons.add_shopping_cart,
                                          color: color1,
                                          size: size.height * 0.06,),
                                        Text("SELECCION DE PRODUCTOS",
                                          style: TextStyle(
                                              fontSize: size.height * 0.02,
                                              color: color1),
                                          textAlign: TextAlign.center,),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (_) => BlocProvider.value(value: BlocProvider.of<GeneralBloc>(context),child: ClientesPage(),)));
                                  },
                                  child: Container(
                                    height: size.width * 0.3,
                                    width: size.width * 0.35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: color2
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Icon(Icons.group_add, color: color1,
                                          size: size.height * 0.06,),
                                        Text("NUEVOS \nCLIENTES",
                                          style: TextStyle(
                                              fontSize: size.height * 0.02,
                                              color: color1),
                                          textAlign: TextAlign.center,),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.05,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => HistoryPage()));
                                  },
                                  child: Container(
                                    height: size.width * 0.3,
                                    width: size.width * 0.35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: color2
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Icon(Icons.history, color: color1,
                                          size: size.height * 0.06,),
                                        Text("HISTORIAL DE VENTAS",
                                          style: TextStyle(
                                              fontSize: size.height * 0.02,
                                              color: color1),
                                          textAlign: TextAlign.center,),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (_) => BlocProvider.value(value: BlocProvider.of<GeneralBloc>(context),child: NewProductsPage(),)));
                                  },
                                  child: Container(
                                    height: size.width * 0.3,
                                    width: size.width * 0.35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: color2
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Icon(Icons.library_add, color: color1,
                                          size: size.height * 0.06,),
                                        Text("NUEVOS \nPRODUCTOS",
                                          style: TextStyle(
                                              fontSize: size.height * 0.02,
                                              color: color1),
                                          textAlign: TextAlign.center,),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.05,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<LoginBloc>(context).add(
                                        LoginSingOutEvent());
                                  },
                                  child: Container(
                                    height: size.width * 0.23,
                                    width: size.width * 0.25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: color1
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Icon(Icons.exit_to_app, color: color2,
                                          size: size.height * 0.06,),
                                        Text("SALIR", style: TextStyle(
                                            fontSize: size.height * 0.02,
                                            color: color2),
                                          textAlign: TextAlign.center,),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
              );
            }else if(state is ClientsNotConfirmState){
              return ClientesPage();
            }
            else if(state is LoadingPageState){
              return LoadingPage();
            }
            else{
              return SafeArea(
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    body: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/background3.png"),
                              fit: BoxFit.cover,
                              //colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                            ),
                          ),
                        ),

                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: size.width * 0.07,
                                  right: size.width * 0.06,
                                  top: size.width * 0.06),
                              height: size.height * 0.08,
                              width: size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Icon(Icons.menu, color: color1,
                                    size: size.height * 0.05,),
                                  Icon(Icons.exit_to_app, color: color1,
                                    size: size.height * 0.06,),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height * 0.1,),
                            Container(
                              width: size.width * 0.65,
                              child: Image(image: AssetImage(
                                  'assets/images/logoItecsa4.png'),),
                            ),
                            // Text("ITECSA",style: TextStyle(fontSize: size.height*0.05,color: color1,fontWeight: FontWeight.bold),),
                            SizedBox(height: size.height * 0.15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => ProductsPage()));
                                  },
                                  child: Container(
                                    height: size.width * 0.3,
                                    width: size.width * 0.35,
                                    //padding: EdgeInsets.only(left: size.height*0.015,right: size.height*0.015),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: color2
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Icon(Icons.add_shopping_cart,
                                          color: color1,
                                          size: size.height * 0.06,),
                                        Text("SELECCION DE PRODUCTOS",
                                          style: TextStyle(
                                              fontSize: size.height * 0.02,
                                              color: color1),
                                          textAlign: TextAlign.center,),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {

                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (_) => BlocProvider.value(value: BlocProvider.of<GeneralBloc>(context),child: ClientesPage(),)));
                                  },
                                  child: Container(
                                    height: size.width * 0.3,
                                    width: size.width * 0.35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: color2
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Icon(Icons.group_add, color: color1,
                                          size: size.height * 0.06,),
                                        Text("NUEVOS \nCLIENTES",
                                          style: TextStyle(
                                              fontSize: size.height * 0.02,
                                              color: color1),
                                          textAlign: TextAlign.center,),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.05,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => HistoryPage()));
                                  },
                                  child: Container(
                                    height: size.width * 0.3,
                                    width: size.width * 0.35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: color2
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Icon(Icons.history, color: color1,
                                          size: size.height * 0.06,),
                                        Text("HISTORIAL DE VENTAS",
                                          style: TextStyle(
                                              fontSize: size.height * 0.02,
                                              color: color1),
                                          textAlign: TextAlign.center,),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (_) => BlocProvider.value(value: BlocProvider.of<GeneralBloc>(context),child: NewProductsPage(),)));
                                  },
                                  child: Container(
                                    height: size.width * 0.3,
                                    width: size.width * 0.35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: color2
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Icon(Icons.library_add, color: color1,
                                          size: size.height * 0.06,),
                                        Text("NUEVOS \nPRODUCTOS",
                                          style: TextStyle(
                                              fontSize: size.height * 0.02,
                                              color: color1),
                                          textAlign: TextAlign.center,),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 0.05,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<LoginBloc>(context).add(
                                        LoginSingOutEvent());
                                  },
                                  child: Container(
                                    height: size.width * 0.23,
                                    width: size.width * 0.25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        color: color1
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Icon(Icons.exit_to_app, color: color2,
                                          size: size.height * 0.06,),
                                        Text("SALIR", style: TextStyle(
                                            fontSize: size.height * 0.02,
                                            color: color2),
                                          textAlign: TextAlign.center,),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
              );
            }
          }
      ),
    );

  }
}
