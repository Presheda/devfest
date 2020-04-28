import 'package:devfest/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_bloc.dart';
import 'home_event.dart';
import 'home_widget/home_front.dart';

class HomeScreen extends StatefulWidget {

  final HomeBloc _homeBloc;

  const HomeScreen({
    Key key,
    @required HomeBloc homeBloc,
  })  : _homeBloc = homeBloc,
        super(key: key);




  @override
  HomeScreenState createState() => HomeScreenState(_homeBloc);
}

class HomeScreenState extends State<HomeScreen> {


  final HomeBloc _homeBloc;


  HomeScreenState(this._homeBloc);


  @override
  void initState() {
    super.initState();
    this._homeBloc.add(LoadHomeEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: widget._homeBloc,
      builder: (context, currentState){
        if(currentState is ErrorHomeState){
          return Center(
              child:
              CircularProgressIndicator()
          );
        }

        return HomeFront();
      },
    );
  }
}
