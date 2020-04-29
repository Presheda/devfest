import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:devfest/home/speaker.dart';
import 'package:devfest/universal/dev_scaffold.dart';
import 'package:devfest/utils/tool.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SpeakersPage extends StatelessWidget {

  static const String routeName = "/speakers";

  _launchURL(String url) async {
    if(await canLaunch(url)){
      await _launchURL(url);
    } else{
      throw "Could not launch url $url";
    }
  }

  Widget socialActions(context) => FittedBox(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: Icon(FontAwesomeIcons.facebookF, size: 15,),
          onPressed: () async {
            await _launchURL("https://facebook.com/imthepk");
          },
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.twitter,
            size: 15,
          ),
          onPressed: () async {
            await _launchURL("https://twitter.com/imthepk");
          },
        ),
        IconButton(
          icon: Icon(FontAwesomeIcons.linkedinIn, size: 15,),
          onPressed: () async {
            _launchURL("https://linkedin.com/in/imthepk");
          },
        ),

        IconButton(
          icon: Icon(FontAwesomeIcons.meetup, size: 15,),
          onPressed: () async {
            await _launchURL("https://meetup.com/");
          },
        ),

      ],
    ),
  );



  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      title: "Speaker",
      body: ListView.builder(
         shrinkWrap: true,
        itemCount: speakers.length,
        itemBuilder: (c, i){
           return Card(
             elevation: 0.0,
             child: Padding(
               padding: EdgeInsets.all(12),
               child: Row(
                 mainAxisSize:  MainAxisSize.min,
                 children: <Widget>[
                   ConstrainedBox(
                     constraints: BoxConstraints.expand(
                       height: MediaQuery.of(context).size.height * 0.2,
                       width:  MediaQuery.of(context).size.width * 0.3
                     ),
                     child: CachedNetworkImage(
                       imageUrl: speakers[i].speakerImage,
                       fit: BoxFit.cover,
                     ),
                   ),
                   SizedBox(
                     width: 20,
                   ),

                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                       mainAxisSize: MainAxisSize.min,
                       children: <Widget>[
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisSize: MainAxisSize.min,
                           children: <Widget>[
                             Text(
                                 speakers[i].speakerName,
                               style: Theme.of(context).textTheme.title,
                             ),
                             SizedBox(
                               height : 5,
                             ),
                             AnimatedContainer(

                               duration: Duration(seconds: 1),
                               width : MediaQuery.of(context).size.width * 0.2,
                               height : 5,
                               color: Tools.multiColors[Random().nextInt(4)]
                             ),

                           ],
                         ),
                         SizedBox(
                           height: 10,
                         ),
                         Text(
                           speakers[i].speakerDesc,
                           style: Theme.of(context).textTheme.subtitle,
                         ),
                         SizedBox(
                           height: 10,
                         ),
                         Text(
                           speakers[i].speakerSession,
                           style: Theme.of(context).textTheme.caption,
                         ),

                         socialActions(context)

                       ],
                     ),
                   )
                 ],
               ),
             ),
           );
        },
      ),

    );
  }
}
