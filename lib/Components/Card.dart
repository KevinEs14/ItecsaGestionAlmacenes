import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:itecsa/Colors.dart';
class NewCard extends StatelessWidget{
  double _width;
  double _height;

  NewCard(this._width,this._height);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(

      padding: EdgeInsets.all(0),
        //color: color4,
        onPressed:(){

        },
        child: Container(
          width: _width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: color2
          ),
          child: Row(
            children: [
              Container(
                width: _width*0.3,
                color: color2,
                child: Image(image: AssetImage("assets/images/login.jpg"),fit: BoxFit.fill,),
              ),
              Container(
                width: _width*0.7,
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      color: color2,
                      child: AutoSizeText("Esta es una prueba del inicio",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 50),maxLines: 3,minFontSize: 1,maxFontSize: 18),
                    ),
                    Container(
                      height: 55,
                      color: color1,
                      child: AutoSizeText("Esta es una prueba del medo del texto",textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontSize: 50),maxLines: 3,minFontSize: 1,maxFontSize: 18),
                    ),
                    Container(
                      height: 40,
                      color: color3,
                      child: AutoSizeText("Esta es una prueba del final del texto",textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontSize: 50),maxLines: 3,minFontSize: 1,maxFontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
    ),
        );
  }
}