import 'package:devfest/config/config_bloc.dart';
import 'package:devfest/utils/devfest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc configBloc;

  @override
  void initState() {
    super.initState();
    setupApp();
  }

  void setupApp() {
    configBloc = ConfigBloc();

    configBloc.darkModeOn = Devfest.prefs.getBool(Devfest.darkModePref) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConfigBloc>(
      create: (context) => configBloc,
      child: MaterialApp(
        title: "Google Devfest",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: Devfest.google_sans_family,
            primarySwatch: Colors.red,
            primaryColor: configBloc.darkModeOn ? Colors.black : Colors.white,
            disabledColor: Colors.grey,
            cardColor: configBloc.darkModeOn ? Colors.black : Colors.white,
            canvasColor: configBloc.darkModeOn ? Colors.black : Colors.white,
            brightness:
                configBloc.darkModeOn ? Brightness.dark : Brightness.light,
            buttonTheme: Theme.of(context).buttonTheme.copyWith(
                colorScheme: configBloc.darkModeOn
                    ? ColorScheme.dark()
                    : ColorScheme.light()),
            appBarTheme: AppBarTheme(elevation: 0.0)),

        home: Scaffold(
          appBar: AppBar(
            title: Text("Google Dev", style: TextStyle(color: Colors.black),),
          ),
          body: Container(),
        ),
      ),
    );
  }
}