import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layot/news_app/cubit/cubit.dart';
import 'package:newsapp/layot/news_app/cubit/status.dart';
import 'package:newsapp/shared/components.dart';

class Search_Screen extends StatelessWidget {

  var searchcontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStatus>(
      listener: (context,state){},
      builder: (context,state)
      {
        var list= NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: searchcontroller,
                  keyboardType: TextInputType.text,
                  validator: (String? value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'Search must not be empty';
                    }
                    return null;
                  },
                  onChanged: (value)
                  {
                    NewsCubit.get(context).getsearch(value);
                  },
                  decoration: InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search_rounded),
                      border: OutlineInputBorder()
                  ),
                ),
              ),
              Expanded(child: articlebuilder(list, context,issearch: true)),
            ],
          ),
        );
      },
    );
  }
}
