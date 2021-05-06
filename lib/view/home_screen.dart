import 'dart:convert' as convert;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hs_test/bloc/homeBloc/home_bloc.dart';
import 'package:hs_test/model/city.dart';
import 'package:hs_test/util/colors.dart';
import 'package:hs_test/view/widgets/city_weather_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Bloc appBloc;
  Bloc homeBloc;
  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
    readJsonFile();
  }

  void readJsonFile() async {
    String data =
        await DefaultAssetBundle.of(context).loadString("asset/Step1.json");
    final jsonResult = convert.jsonDecode(data);
    List jsonCities = jsonResult['List'];
    List<City> cities = jsonCities.map((e) => City.fromJson(e)).toList();
    List<String> ids = [];
    cities.forEach((element) {
      ids.add(element.cityCode);
    });
    print(ids.join(','));
    homeBloc.add(GetWeatherDataEvent(ids));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        backgroundColor: MIDDLE_LIGHT_BLUE,
      ),
      body: Container(
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeSuccess) {
              print('success');
              Future.delayed(Duration(seconds: 60)).then((value) {
                homeBloc.add(GetWeatherDataEvent(state.cityIds));
              });
            }
          },
          builder: (context, state) {
            if (state is HomeLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeSuccess) {
              return Container(
                color: WHITE,
                child: ListView.builder(
                  itemCount: state.data.list.length,
                  itemBuilder: (context, index) {
                    return CityWeather(state.data.list[index]);
                  },
                ),
              );
            }
            if (state is HomeError) {
              return Container(
                child: Center(
                  child: Text(state.message),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
