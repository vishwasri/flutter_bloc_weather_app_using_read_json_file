import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hs_test/bloc/appBloc/app_bloc.dart';
import 'package:hs_test/bloc/homeBloc/home_bloc.dart';
import 'package:hs_test/repository/home_repository.dart';

class MainBloc {
  static List<BlocProvider> allBlocs() {
    return [
      BlocProvider<AppBloc>(
        create: (BuildContext context) => AppBloc(),
      ),
      BlocProvider<HomeBloc>(
        create: (BuildContext context) =>
            HomeBloc(BlocProvider.of<AppBloc>(context), HomeRepository()),
      ),
    ];
  }
}
