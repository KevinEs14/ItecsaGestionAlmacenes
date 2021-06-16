import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:itecsa/Colors.dart';
class HistoryCard extends StatelessWidget{
  double _width;
  double _height;
  Color _backgroundColor;
  Color _color;
  Color _color2;

  HistoryCard(this._width,this._height,this._backgroundColor,this._color,this._color2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      // height: _height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: _backgroundColor
      ),

      child: Card(
        color: _backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExpansionTile(
                title: Text("Nombre Cliente",style: TextStyle(color: _color2,fontSize: _height*0.15),),
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                    Text("Nombre Producto:",style: TextStyle(color: _color,fontSize: _height*0.13),),
                    SizedBox(width: _width*0.01,),
                    Text("Dell",style: TextStyle(color: _color2,fontSize: _height*0.13),),
                  ],),
                  SizedBox(height: _height*0.007,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                    Text("Cantidad:",style: TextStyle(color: _color,fontSize: _height*0.13),),
                    SizedBox(width: _width*0.01,),
                    Text("5",style: TextStyle(color: _color2,fontSize: _height*0.13),),
                  ],),
                  SizedBox(height: _height*0.007,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                    Text("Precio:",style: TextStyle(color: _color,fontSize: _height*0.13),),
                    SizedBox(width: _width*0.01,),
                    Text("150.40",style: TextStyle(color: _color2,fontSize: _height*0.13),),
                  ],),
                  SizedBox(height: _height*0.007,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                    Text("Total:",style: TextStyle(color: _color,fontSize: _height*0.13),),
                    SizedBox(width: _width*0.01,),
                    Text("3024.55",style: TextStyle(color: _color2,fontSize: _height*0.13),),
                  ],),
                  SizedBox(height: _height*0.015,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}