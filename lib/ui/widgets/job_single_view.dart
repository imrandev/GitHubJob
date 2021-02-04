import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_job/bloc/job_list_bloc.dart';

class JobSingleView extends StatelessWidget {
  final String id;

  JobSingleView(this.id);

  @override
  Widget build(BuildContext context) {
    // initial state call the single job api
    BlocProvider.of<JobListBloc>(context).add(FetchSingleJob(id));

    return BlocBuilder<JobListBloc, JobListState>(
      builder: (context, state) {
        if (state is JobListLoaded) {
          return Center(
            child: Text("${state.job.title}"),
          );
        } else if (state is JobListInitial) {
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
