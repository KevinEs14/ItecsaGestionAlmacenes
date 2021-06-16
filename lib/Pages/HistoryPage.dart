import 'package:flutter/material.dart';
import 'package:itecsa/Components/HistoryCard.dart';

import '../Colors.dart';
class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<String> lista=['hola','mundo','esta','es','una','prueba','de','la','pagina','de','historial'];
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
                    image: AssetImage("assets/images/background6.png"),
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
                title: Text("HISTORIAL",style: TextStyle(fontSize: size.height*0.025,color: color1),),
              ),
              body: SingleChildScrollView(
                child: Container(
                  height: size.height,
                  width: size.width,
                  child: ListView.builder(
                      itemCount: lista.length,
                      itemBuilder: (context,index){
                        return Column(
                          children: [
                            SizedBox(height: size.height*0.005,),
                            HistoryCard(size.width*0.95, size.height*0.15, color2, color3, color1),
                            SizedBox(height: size.height*0.012,),
                          ],
                        );
                      }
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
