
import 'package:bloc/bloc.dart';
import 'package:devfest/config/config_event.dart';
import 'package:devfest/config/config_state.dart';
import 'package:devfest/home/index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{

  static final HomeBloc _homeBlocSingleton = HomeBloc._internal();

  factory HomeBloc(){
    return _homeBlocSingleton;
  }

  HomeBloc._internal();

  @override
  HomeState get initialState => InHomeState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    try{
      yield InHomeState();
      yield await event.applyAsync(currentState: state, bloc: this);
    } catch(_, stackTrace){
      print("$_, $stackTrace");
      yield state;
    }
  }



}