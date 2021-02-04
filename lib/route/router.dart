import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_job/blocs/single/single_job_bloc.dart';
import 'package:github_job/ui/home.dart';
import 'package:github_job/ui/job_details.dart';
import 'package:github_job/ui/widgets/job_list_view.dart';
import 'package:github_job/utils/constant.dart';

class GitHubJobRouter {

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Constant.jobHome:
        {
          return MaterialPageRoute(
            builder: (_) => Home(),
          );
        }
      case Constant.jobDetails:
        {
          final ScreenArguments args = routeSettings.arguments;
          return MaterialPageRoute(
            builder: (context) {
              return BlocProvider.value(
                value: BlocProvider.of<SingleJobBloc>(context),
                child: JobDetails(args.id),
              );
            },
          );
        }
      default:
        {
          return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text("No route defined for ${routeSettings.name}"),
              ),
            ),
          );
        }
    }
  }
}
