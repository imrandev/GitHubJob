import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_job/bloc/job_list_bloc.dart';
import 'package:github_job/ui/widgets/job_single_view.dart';

class JobDetails extends StatelessWidget {
  final String id;

  JobDetails(this.id);

  @override
  Widget build(BuildContext context) {
    print("$id");

    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        title: Text("Job Details"),
      ),
      body: Container(
        child: JobSingleView(id),
      ),
    );
  }
}
