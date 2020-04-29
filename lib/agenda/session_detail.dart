
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:devfest/home/session.dart';
import 'package:devfest/universal/dev_scaffold.dart';
import 'package:devfest/utils/tool.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SessionDetail extends StatelessWidget {
  static const String routeName = "/session_detail";

  final Session session;
  SessionDetail({Key key, @required this.session}) : super(key: key) ;

  _launchURL(String url) async {
    if(await canLaunch(url)){
      await _launchURL(url);
    } else{
      throw "Could not launch url $url";
    }
  }

  Widget socialActions(context) => FittedBox(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: Icon(FontAwesomeIcons.facebookF),
          onPressed: () async {
            await _launchURL("https://facebook.com/imthepk");
          },
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.twitter),
          onPressed: () async {
            await _launchURL("https://twitter.com/imthepk");
          },
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.linkedinIn),
          onPressed: () async {
            _launchURL("https://linkedin.com/in/imthepk");
          },
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.youtube),
          onPressed: () async {
            await _launchURL("https://youtube.com/mtechviral");
          },
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.meetup),
          onPressed: () async {
            await _launchURL("https://meetup.com/");
          },
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.envelope),
          onPressed: () async {
            var emailUrl =
            '''mailto:mtechviral@gmail.com?subject=Support Needed For DevFest App&body={Name: Pawan Kumar},Email: pawan221b@gmail.com}''';
            var out = Uri.encodeFull(emailUrl);
            await _launchURL(out);
          },
        ),
      ],
    ),
  );



  @override
  Widget build(BuildContext context) {
    return DevScaffold(
        title: session.speakerName,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Hero(
                    tag: session.speakerImage,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: CachedNetworkImageProvider(
                        session.speakerImage
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${session.speakerDesc}",
                  style: Theme.of(context).textTheme.title.copyWith(
                    fontSize: 14,
                    color: Tools.multiColors[Random().nextInt(4)]
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${session.sessionTitle}",
                  style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${session.sessionDesc}",
                  style: Theme.of(context).textTheme.title.copyWith(
                      fontSize: 13,

                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),

                socialActions(context),

              ],
              )
            ),
          ),
        );
  }
}
