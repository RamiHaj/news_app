import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layot/news_app/cubit/cubit.dart';
import 'package:newsapp/layot/news_app/cubit/status.dart';
import 'package:newsapp/layot/settings/cubit/cubitdark.dart';
import 'package:newsapp/modules/search/search_screen.dart';


class NewsLayot extends StatelessWidget {
  const NewsLayot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStatus>(
      listener: (BuildContext context,NewsStatus state) {},
      builder: (BuildContext context,NewsStatus state) {

        var cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text("News App"),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Search_Screen()));
                  },
                  icon: Icon(Icons.search)
              ),
              IconButton(
                  onPressed: (){
                    NewsCubitDark.get(context).changemode();
                  },
                  icon: Icon(Icons.brightness_4_outlined)
              )
            ],
          ),
          body: cubit.screens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentindex,
            onTap: (index)
            {
              cubit.changebottomindex(index);
            },
            items: cubit.bottomitem,
          ),
        );
      },
    );
  }
}
