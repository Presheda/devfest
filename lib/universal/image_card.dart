import 'package:devfest/config/config_bloc.dart';
import 'package:devfest/utils/devfest.dart';
import 'package:devfest/utils/tool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String img;

  const ImageCard({Key key, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     child:  Container(
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
              img,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
       decoration: BoxDecoration(
         color:  ConfigBloc().darkModeOn ? Tools.hexToColor("#1f2124") : Colors.white,
         borderRadius: BorderRadius.circular(
           10.0,

         )
       ),
        )
    );
  }
}
