import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layot/news_app/cubit/cubit.dart';
import 'package:newsapp/layot/news_app/cubit/status.dart';
import 'package:newsapp/shared/components.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStatus>(
      listener: (BuildContext context, Object? state) {  },
      builder: (BuildContext context, state)
      {
        var list = NewsCubit.get(context).sports;

        return articlebuilder(list,context);
      },
    );
  }
}