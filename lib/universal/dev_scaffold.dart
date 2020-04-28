
import 'package:devfest/config/config_bloc.dart';
import 'package:devfest/config/config_event.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

class DevScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget tabBar;


  DevScaffold({Key key, @required this.title, @required this.body, this.tabBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      color: ConfigBloc().darkModeOn ?
      Colors.grey[800] : Colors.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            bottom: tabBar != null ? tabBar : null,
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    ConfigBloc().darkModeOn ? FontAwesomeIcons.lightbulb :
                        FontAwesomeIcons.solidLightbulb,
                    size: 18,
                  ),
                  onPressed: (){
                    ConfigBloc().add(DarkModeEvent(!ConfigBloc().darkModeOn));
                  }
              ),
              IconButton(
                  icon: Icon(Icons.share, size: 20),
                  onPressed: ()=> Share.share(
                    "Download the new DevFest App and share with your tech friends"
                  )
              )
            ],
          ),
          body: body,
        ),
      ),
    );
  }
}
