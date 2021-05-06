part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetWeatherDataEvent extends HomeEvent {
  final List<String> cityIds;
  GetWeatherDataEvent(this.cityIds);
}
