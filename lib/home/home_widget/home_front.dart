import 'package:devfest/config/config_bloc.dart';
import 'package:devfest/universal/image_card.dart';
import 'package:devfest/utils/devfest.dart';
import 'package:flutter/material.dart';
class HomeFront extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ImageCard(
              img: ConfigBloc().darkModeOn ? Devfest.banner_dark : Devfest.banner_light
            ),
          ],
        ),
      ),
    );
  }
}
