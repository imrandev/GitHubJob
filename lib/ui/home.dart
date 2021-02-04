import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_job/blocs/base/base_state.dart';
import 'package:github_job/blocs/jobs/jobs_bloc.dart';
import 'package:github_job/ui/widgets/job_list_view.dart';
import 'package:github_job/utils/path_arguments.dart';
import 'package:github_job/utils/route_path.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // initial state call the job list api
    BlocProvider.of<JobsBloc>(context).add(FetchJobs());

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: BlocBuilder<JobsBloc, BaseJobState>(
          builder: (context, state) {
            if (state is JobLoaded) {
              return JobListView(state.jobs);
            } else if (state is InitialState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is JobError) {
              return Center(
                child: Text(
                  "${state.msg}",
                ),
              );
            }
            return Center(
              child: Text("No job found"),
            );
          },
        ),
      ),
    );
  }
}
