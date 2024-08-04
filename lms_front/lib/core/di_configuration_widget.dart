import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_front/core/di_container.dart';

class DiConfigurationWidget extends StatelessWidget {
  const DiConfigurationWidget(
    this._diContainer, {
    required this.builder,
    super.key,
  });

  final DiContainer _diContainer;
  final Widget Function(BuildContext) builder;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // RepositoryProvider<RepositoryA>(create: (context) => RepositoryA(_diContainer.httpClient)),
        // RepositoryProvider<RepositoryB>(create: (context) => RepositoryB(_diContainer.cacheDataProvider)),
        // RepositoryProvider<RepositoryC>(create: (context) => RepositoryC(_diContainer.courseDataProvider)),
      ],
      //global blocs
      child: MultiBlocProvider(
        providers: [
          // BlocProvider(
          //   create: (context) => Provider.of<RepositoryA>(context, listen: false),
          // ),
        ],
        child: builder(context),
      ),
    );
  }
}
