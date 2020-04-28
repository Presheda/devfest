 import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  HomeState getStateCopy();



}
class UnHomeState extends HomeState{

  @override
  HomeState getStateCopy() {
    return UnHomeState();
  }

  @override
  List<Object> get props => null;

  @override
  String toString() {
    return "UnHomeState";
  }

}

class InHomeState extends HomeState{

  @override
  HomeState getStateCopy() {
    return InHomeState();
  }

  @override
  List<Object> get props => null;

  @override
  String toString() {
    return "InHomeState";
  }

}
class ErrorHomeState extends HomeState{

  final String errorMessage;

  ErrorHomeState(this.errorMessage);


  @override
  HomeState getStateCopy() {
    return ErrorHomeState(errorMessage);
  }

  @override
  List<Object> get props => null;

  @override
  String toString() {
    return "ErrorHomeState";
  }

}

