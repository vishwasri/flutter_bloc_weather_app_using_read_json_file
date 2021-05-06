part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final WeatherApi data;
  final List<String> cityIds;
  HomeSuccess({this.data, this.cityIds});
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
