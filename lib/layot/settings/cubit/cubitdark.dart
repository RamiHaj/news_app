import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layot/settings/cubit/statusdark.dart';
import 'package:newsapp/network/local/chache_helper.dart';

class NewsCubitDark extends Cubit<NewsDarkStatus>
{
  NewsCubitDark() : super(NewsInitialDarkState());

  static NewsCubitDark get(context) => BlocProvider.of(context);

  bool isdark = false;

  void changemode({bool? FromShared}) {
    if (FromShared != null) {
      emit(NewsChangeModeStatus());
      isdark = FromShared;
    }
    else {
      isdark = !isdark;
      Chache_Helper.setdata(key: "isdark", value: isdark).then((value) {
        emit(NewsChangeModeStatus());
      });
    }
  }
}