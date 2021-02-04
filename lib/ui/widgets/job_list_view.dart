import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_job/blocs/base/base_state.dart';
import 'package:github_job/blocs/jobs/jobs_bloc.dart';
import 'package:github_job/utils/path_arguments.dart';
import 'package:github_job/utils/route_path.dart';

class JobListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // initial state call the job list api
    BlocProvider.of<JobsBloc>(context).add(FetchJobs());

    return BlocBuilder<JobsBloc, BaseJobState>(
      builder: (context, state) {
        if (state is JobLoaded) {
          return ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: state.jobs.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => {
                  Navigator.pushNamed(
                    context,
                    RoutePath.singleJob,
                    arguments: PathArguments(
                      state.jobs[index].id,
                    ),
                  ),
                },
                leading: SizedBox(
                  width: 100,
                  child: Image.network(
                    state.jobs[index].companyLogo == null
                        ? "https://www.pngitem.com/pimgs/m/78-788231_icon-blue-company-icon-png-transparent-png.png"
                        : state.jobs[index].companyLogo,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                title: Text(
                  "${state.jobs[index].title}",
                ),
              );
            },
          );
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
          child: Text(
              "No job found"
          ),
        );
      },
    );
  }
}
