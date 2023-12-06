import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Colors/colors.dart';
import '../Text/text.dart';
class BuildButton extends StatelessWidget{
  var height;
  var width;
  var text;
  var function;
  var color;
  var  shape;

  BuildButton({
    required this.height,
    required this.width,
    required this.text,
    required this.function,
     this.color,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: MaterialButton(

        shape:shape ,
        onPressed: function,
        child: BuildText(
          text: text,
          color: Colors.white,
          bold: true,
        ),
        color: HexColor('FE798C'),
      ),
    );
  }
}