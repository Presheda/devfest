import 'package:devfest/config/config_state.dart';
import 'package:devfest/utils/devfest.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'index.dart';

@immutable
abstract class ConfigEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => null;

  ConfigEvent([List props = const <dynamic>[]]) : super();

  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc});


}

class DarkModeEvent extends ConfigEvent{

  final bool darkOn;


  DarkModeEvent(this.darkOn);

  @override
  String toString() => "DarkModeEvent";

  @override
  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc}) async {


    try{
      bloc.darkModeOn = darkOn;
      Devfest.prefs.setBool(Devfest.darkModePref, darkOn);

      return InConfigState();
    } catch(_, stackTrace){
      print("$_, $stackTrace");
      return ErrorConfigState(_?.toString());
    }

  }

}

class LoadConfigEvent extends ConfigEvent{

  @override
  String toString() => "LoadConfigEvent";

  @override
  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc}) async {

    try {
      await Future.delayed(Duration(seconds: 2));
      return InConfigState();
    } catch(_, stackTrace){
      print("$_, $stackTrace");
      return ErrorConfigState(_?.toString());
    }
  }

}
