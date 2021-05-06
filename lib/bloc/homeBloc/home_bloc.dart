import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hs_test/bloc/appBloc/app_bloc.dart';
import 'package:hs_test/model/weather_api.dart';
import 'package:hs_test/repository/home_repository.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppBloc appBloc;
  final HomeRepository homeRepository;
  HomeBloc(this.appBloc, this.homeRepository) : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    try {
      if (event is GetWeatherDataEvent) {
        yield HomeLoading();
        WeatherApi data = await homeRepository.getSyncStatus(event.cityIds);
        yield HomeSuccess(data: data, cityIds: event.cityIds);
      }
    } catch (e) {
      log(e.toString());
      yield HomeError('Something went wrong');
    }
  }
}
