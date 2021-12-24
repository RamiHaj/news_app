import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layot/news_app/cubit/status.dart';
import 'package:newsapp/modules/businees/business_screen.dart';
import 'package:newsapp/modules/science/science_screen.dart';
import 'package:newsapp/modules/sports/sportscreen.dart';
import 'package:newsapp/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStatus>
{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentindex =0;

  List<Widget> screens =
  [
    BusniessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];

  List<BottomNavigationBarItem> bottomitem =
  [
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: "Business"
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: "Sport"
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.science),
        label: "Science"
    ),
  ];

  void changebottomindex(int index)
  {
    currentindex = index;
    if(index==1)
      getsports();
    else if(index==2)
      getscience();
    emit(NewsBottomNavStatus());
  }

  List<dynamic> businees=[];

  void getbusiness()
  {
    emit(NewsBussinesLoadingStatus());
    DioHelper.getdata(
        url: "v2/top-headlines",
        query:
        {
          'country':'de',
          'category':'business',
          'apiKey':'9ae7ca1554524657901668af2fa9b280',
        }
    ).then((value)
    {
      businees= value.data['articles'];
      print(businees[0]['title']);

      emit(NewsBusinessSucssesStatus());
    }).catchError((onError)
    {
      print("error : ${onError.toString()}");
      emit(NewsBusinessEroorStatus(onError));
    });
  }

  List<dynamic> sports=[];

  void getsports()
  {
    emit(NewsSportsLoadingStatus());

    if(sports.length ==0)
    {
      DioHelper.getdata(
          url: "v2/top-headlines",
          query:
          {
            'country':'de',
            'category':'sports',
            'apiKey':'9ae7ca1554524657901668af2fa9b280',
          }
      ).then((value)
      {
        sports= value.data['articles'];

        emit(NewsSportsSucssesStatus());
      }).catchError((onError)
      {
        print("error : ${onError.toString()}");
        emit(NewsSportsEroorStatus(onError));
      });
    }
    else
      {
        emit(NewsSportsSucssesStatus());
    }

  }

  List<dynamic> science=[];

  void getscience() {
    emit(NewsScienceLoadingStatus());

    if (science.length == 0)
    {
      DioHelper.getdata(
          url: "v2/top-headlines",
          query:
          {
            'country': 'de',
            'category': 'science',
            'apiKey': '9ae7ca1554524657901668af2fa9b280',
          }
      ).then((value) {
        science = value.data['articles'];

        emit(NewsScienceSucssesStatus());
      }).catchError((onError) {
        print("error : ${onError.toString()}");
        emit(NewsScienceEroorStatus(onError));
      });
    }
    else
      {
        emit(NewsScienceSucssesStatus());
      }
  }

  List<dynamic> search=[];

  void getsearch(String value) {
    emit(NewsSearchLoadingStatus());
    search = [];

    DioHelper.getdata(
        url: "v2/everything",
        query:
        {
          'q': '$value',
          'apiKey': '9ae7ca1554524657901668af2fa9b280',
        }
    ).then((value) {
      search = value.data['articles'];

      emit(NewsSearchSucssesStatus());
    }).catchError((onError) {
      print("error : ${onError.toString()}");
      emit(NewsSearchEroorStatus(onError));
    });
  }
  }