import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layot/news_app/cubit/cubit.dart';
import 'package:newsapp/layot/news_app/cubit/status.dart';
import 'package:newsapp/shared/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStatus>(
      listener: (BuildContext context, Object? state) {  },
      builder: (BuildContext context, state)
      {
        var list = NewsCubit.get(context).science;

        return articlebuilder(list,context);
      },
    );
  }
}