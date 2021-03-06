import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itecsa/Bloc/Bloc/GeneralBloc.dart';
import 'package:itecsa/Bloc/Events/GeneralEvents.dart';
import 'package:itecsa/Bloc/States/GeneralStates.dart';
import 'package:itecsa/Models/Client.dart';

import '../Colors.dart';
class ClientesPage extends StatefulWidget {
  @override
  _ClientesPageState createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  TextEditingController _nombre=TextEditingController();
  TextEditingController _empresa=TextEditingController();
  TextEditingController _direccion=TextEditingController();
  TextEditingController _telefono=TextEditingController();
  Client _client=Client();
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
                    image: AssetImage("assets/images/background7.png"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken),
                  ),
                ),
              ),
            ),
                Scaffold(
                  backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: color2,
                  elevation: 5,
                  title: Text("CLIENTES",style: TextStyle(fontSize: size.height*0.025,color: color1),),
                ),
              body: BlocListener<GeneralBloc,GeneralStates>(

                listener: (context,state){
                  if(state is MenuConfirmState){Navigator.pop(context);}},
                  child: SingleChildScrollView(
                    child: Container(
                      height: size.height-MediaQuery.of(context).padding.top,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(
                          //   height: size.width * 0.2,
                          // ),
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
                                Icon(Icons.person,color: color11,),
                                Container(
                                  width: size.width*0.77,
                                  child: TextField(
                                    controller: _nombre,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(size.height * 0.01),
                                        labelText: "Nombre: ",
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
                            height: size.width * 0.08,
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
                                Icon(Icons.home_work,color: color11,),
                                Container(
                                  width: size.width*0.77,
                                  child: TextField(
                                    controller: _empresa,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(size.height * 0.01),
                                        labelText: "Empresa: ",
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
                            height: size.width * 0.08,
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
                                Icon(Icons.map,color: color11,),
                                Container(
                                  width: size.width*0.77,
                                  child: TextField(
                                    controller: _direccion,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(size.height * 0.01),
                                        labelText: "Direccion: ",
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
                            height: size.width * 0.08,
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
                                Icon(Icons.phone,color: color11,),
                                Container(
                                  width: size.width*0.77,
                                  child: TextField(
                                    controller: _telefono,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(size.height * 0.01),
                                        labelText: "Telefono: ",
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
                              _client.company=_empresa.text;
                              _client.name=_nombre.text;
                              _client.direction=_direccion.text;
                              _client.phone=int.parse(_telefono.text);
                              BlocProvider.of<GeneralBloc>(context).add(NewClientsEvent(_client));
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
                                "A??adir",
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
