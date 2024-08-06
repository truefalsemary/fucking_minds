import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_front/core/app_router/app_router_inh.dart';
import 'package:lms_front/core/di/di_container.dart';

class DiTreeWidget extends StatelessWidget {
  const DiTreeWidget(
    this._diContainer, {
    required this.builder,
    super.key,
  });

  // Temp ignore for the time being
  // ignore: unused_field
  final DiContainer _diContainer;
  final Widget Function(BuildContext) builder;

  @override
  Widget build(BuildContext context) {
    return AppRouter(
      router: _diContainer.routerDelegate.router,
      child: builder(context),
    );
    return MultiRepositoryProvider(
      providers: const [
        // RepositoryProvider<RepositoryA>(create: (context) => RepositoryA(_diContainer.httpClient)),
        // RepositoryProvider<RepositoryB>(create: (context) => RepositoryB(_diContainer.cacheDataProvider)),
        // RepositoryProvider<RepositoryC>(create: (context) => RepositoryC(_diContainer.courseDataProvider)),
      ],
      //global blocs
      child: MultiBlocProvider(
        providers: const [
          // BlocProvider(
          //   create: (context) => Provider.of<RepositoryA>(context, listen: false),
          // ),
        ],
        child: builder(context),
      ),
    );
  }
}
