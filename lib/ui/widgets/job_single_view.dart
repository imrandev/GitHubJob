import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_job/bloc/job_bloc.dart';

class JobSingleView extends StatelessWidget {
  final String id;

  JobSingleView(this.id);

  @override
  Widget build(BuildContext context) {
    // initial state call the single job api
    BlocProvider.of<JobBloc>(context).add(FetchSingleJob(id));

    return BlocBuilder<JobBloc, JobState>(
      builder: (context, state) {
        if (state is JobLoaded) {
          return Center(
            child: Text("${state.job.title}"),
          );
        } else if (state is InitialState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: Text("No job found"),
        );
      },
    );
  }
}
