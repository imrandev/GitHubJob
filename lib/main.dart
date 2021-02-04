import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_job/blocs/single/single_job_bloc.dart';
import 'package:github_job/route/router.dart';
import 'package:github_job/utils/constant.dart';

import 'blocs/jobs/jobs_bloc.dart';
import 'data/repository/job_repository.dart';

void main() {
  runApp(GithubJobApp());
}

class GithubJobApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => JobsBloc(JobRepository()),
        ),
        BlocProvider(
          create: (context) => SingleJobBloc(JobRepository()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue,
          backgroundColor: Colors.white,
        ),
        title: "GitHub Job",
        onGenerateRoute: GitHubJobRouter.generateRoute,
        initialRoute: Constant.jobHome,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}