import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:itecsa/Colors.dart';
class NewCard extends StatelessWidget{
  double _width;
  double _height;
  QuerySnapshot _querySnapshot;
  int _index;

  NewCard(this._width,this._height,this._querySnapshot,this._index);

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
                      child: AutoSizeText(_querySnapshot.docs[_index]["nombre"],textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 50),maxLines: 3,minFontSize: 1,maxFontSize: 18),
                    ),
                    Container(
                      height: 55,
                      color: color1,
                      child: AutoSizeText(_querySnapshot.docs[_index]["descripcion"],textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontSize: 50),maxLines: 3,minFontSize: 1,maxFontSize: 18),
                    ),
                    Container(
                      height: 40,
                      color: color3,
                      child: AutoSizeText(_querySnapshot.docs[_index]["precio"].toString(),textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontSize: 50),maxLines: 3,minFontSize: 1,maxFontSize: 18),
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