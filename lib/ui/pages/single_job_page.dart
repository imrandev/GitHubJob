import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_job/blocs/base/base_state.dart';
import 'package:github_job/blocs/single/single_job_bloc.dart';
import 'package:github_job/ui/widgets/job_single_view.dart';

class SingleJobPage extends StatelessWidget {
  final String id;

  SingleJobPage(this.id);

  @override
  Widget build(BuildContext context) {
    // initial state call the single job api
    BlocProvider.of<SingleJobBloc>(context).add(FetchSingleJob(id));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {
            Navigator.pop(context),
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text("Job Details"),
      ),
      body: Container(
        child: BlocBuilder<SingleJobBloc, BaseJobState>(
          builder: (context, state) {
            if (state is SingleJobLoaded) {
              return JobSingleView(state.job);
            } else if (state is InitialState) {
              return Center(
                child: CircularProgressIndicator(),
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
